import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/localization/l10n.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_events.dart';
import '../blocs/auth_states.dart';
import '../model/auth_user_model.dart';

class EditUserPage extends StatefulWidget {
  final AuthUserModel user;

  const EditUserPage({super.key, required this.user});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _loginController;
  final _senhaController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.user.descnome);
    _loginController = TextEditingController(text: widget.user.desclogin);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _loginController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _handleUpdate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Get password value, null if empty
      final senha = _senhaController.text.trim().isEmpty
          ? null
          : _senhaController.text;

      context.read<AuthBloc>().add(
        UpdateUserEvent(
          nome: _nomeController.text.trim(),
          login: _loginController.text.trim(),
          senha: senha,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.instance<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.edit_profile),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is UserUpdated) {
                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Perfil atualizado com sucesso!'),
                    backgroundColor: Colors.green,
                  ),
                );
                // Navigate back to profile page
                context.pop();
              } else if (state is AuthError) {
                // Show error message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              final isLoading = state is AuthLoading;

              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person, size: 50),
                    ),
                    const SizedBox(height: 24),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Informações do Usuário',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Divider(),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _nomeController,
                              decoration: const InputDecoration(
                                labelText: 'Nome',
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              enabled: !isLoading,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Por favor, informe o nome';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _loginController,
                              decoration: const InputDecoration(
                                labelText: 'Login',
                                prefixIcon: Icon(Icons.account_circle),
                                border: OutlineInputBorder(),
                              ),
                              enabled: !isLoading,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Por favor, informe o login';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _senhaController,
                              decoration: InputDecoration(
                                labelText: 'Nova Senha (opcional)',
                                helperText:
                                    'Deixe em branco para manter a senha atual',
                                prefixIcon: const Icon(Icons.lock),
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                              ),
                              obscureText: _obscurePassword,
                              enabled: !isLoading,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      color: Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Informações Somente Leitura',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Divider(),
                            const SizedBox(height: 8),
                            _buildReadOnlyRow(
                              context,
                              'Email',
                              widget.user.descemail,
                            ),
                            const SizedBox(height: 8),
                            _buildReadOnlyRow(
                              context,
                              'Unidade',
                              widget.user.descunidade.isEmpty
                                  ? 'Não definido'
                                  : widget.user.descunidade,
                            ),
                            const SizedBox(height: 8),
                            _buildReadOnlyRow(
                              context,
                              'Perfil',
                              widget.user.descperfil.isEmpty
                                  ? 'Não definido'
                                  : widget.user.descperfil,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () => _handleUpdate(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text(
                              'Salvar Alterações',
                              style: TextStyle(fontSize: 16),
                            ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: isLoading ? null : () => context.pop(),
                      child: const Text('Cancelar'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildReadOnlyRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
