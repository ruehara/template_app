import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/core/services/localization/l10n.dart';
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
              switch (state) {
                case UserUpdated():
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.l10n.profileUpdatedSuccess),
                      backgroundColor: Colors.green,
                    ),
                  );
                  context.pop();
                case AuthError(:final message):
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                default:
                  break;
              }
            },
            builder: (context, state) {
              final l10n = context.l10n;
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
                              l10n.userInfoTitle,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Divider(),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _nomeController,
                              decoration: InputDecoration(
                                labelText: l10n.nameLabel,
                                prefixIcon: const Icon(Icons.person),
                                border: const OutlineInputBorder(),
                              ),
                              enabled: !isLoading,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return l10n.nameRequired;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _loginController,
                              decoration: InputDecoration(
                                labelText: l10n.loginLabel,
                                prefixIcon: const Icon(Icons.account_circle),
                                border: const OutlineInputBorder(),
                              ),
                              enabled: !isLoading,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return l10n.loginRequired;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _senhaController,
                              decoration: InputDecoration(
                                labelText: l10n.newPasswordLabel,
                                helperText: l10n.passwordHelperText,
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
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.readonlyInfoTitle,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Divider(),
                            const SizedBox(height: 8),
                            _buildReadOnlyRow(
                              context,
                              l10n.emailLabel,
                              widget.user.descemail,
                            ),
                            const SizedBox(height: 8),
                            _buildReadOnlyRow(
                              context,
                              l10n.unitLabel,
                              widget.user.descunidade.isEmpty
                                  ? l10n.notDefined
                                  : widget.user.descunidade,
                            ),
                            const SizedBox(height: 8),
                            _buildReadOnlyRow(
                              context,
                              l10n.fieldRole,
                              widget.user.descperfil.isEmpty
                                  ? l10n.notDefined
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
                          : Text(
                              l10n.saveChangesButton,
                              style: const TextStyle(fontSize: 16),
                            ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: isLoading ? null : () => context.pop(),
                      child: Text(l10n.cancelButton),
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
