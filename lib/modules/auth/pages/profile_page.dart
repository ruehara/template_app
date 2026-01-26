import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_events.dart';
import '../blocs/auth_states.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.instance<AuthBloc>()..add(const CheckAuthEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Perfil'), centerTitle: true),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Unauthenticated) {
              // Redirect to login page when user logs out
              context.goNamed('login');
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is Authenticated) {
              final user = state.user;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      child: Icon(Icons.person, size: 60),
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
                            const SizedBox(height: 8),
                            _buildInfoRow(
                              context,
                              Icons.person,
                              'Nome',
                              user.descnome,
                            ),
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              context,
                              Icons.account_circle,
                              'Login',
                              user.desclogin,
                            ),
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              context,
                              Icons.email,
                              'Email',
                              user.descemail,
                            ),
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              context,
                              Icons.business,
                              'Unidade',
                              user.descunidade.isEmpty
                                  ? 'Não definido'
                                  : user.descunidade,
                            ),
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              context,
                              Icons.badge,
                              'Perfil',
                              user.descperfil.isEmpty
                                  ? 'Não definido'
                                  : user.descperfil,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.goNamed('edit-profile', extra: user);
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Editar Perfil'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: () {
                        // Show confirmation dialog
                        showDialog(
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                            title: const Text('Sair'),
                            content: const Text(
                              'Deseja realmente sair do sistema?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(dialogContext).pop();
                                  context.read<AuthBloc>().add(
                                    const LogoutEvent(),
                                  );
                                },
                                child: const Text('Sair'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Sair'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is AuthError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(state.message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(const CheckAuthEvent());
                      },
                      child: const Text('Tentar Novamente'),
                    ),
                  ],
                ),
              );
            }

            return const Center(child: Text('Estado desconhecido'));
          },
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Theme.of(context).primaryColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 4),
              Text(value, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
