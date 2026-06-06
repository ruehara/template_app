import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/core/services/localization/l10n.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_events.dart';
import '../blocs/auth_states.dart';
import '../repository/i_auth_repository.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (_) =>
          AuthBloc(GetIt.instance<IAuthRepository>())
            ..add(const CheckAuthEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.profileLabel), centerTitle: true),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            switch (state) {
              case Unauthenticated():
                context.goNamed('login');
              default:
                break;
            }
          },
          builder: (context, state) {
            final l10n = context.l10n;
            return switch (state) {
              AuthLoading() => const Center(child: CircularProgressIndicator()),
              Authenticated(:final user) => SingleChildScrollView(
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
                              l10n.userInfoTitle,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Divider(),
                            const SizedBox(height: 8),
                            _buildInfoRow(
                              context,
                              Icons.person,
                              l10n.nameLabel,
                              user.descnome,
                            ),
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              context,
                              Icons.account_circle,
                              l10n.loginLabel,
                              user.desclogin,
                            ),
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              context,
                              Icons.email,
                              l10n.emailLabel,
                              user.descemail,
                            ),
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              context,
                              Icons.business,
                              l10n.unitLabel,
                              user.descunidade.isEmpty
                                  ? l10n.notDefined
                                  : user.descunidade,
                            ),
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              context,
                              Icons.badge,
                              l10n.fieldRole,
                              user.descperfil.isEmpty
                                  ? l10n.notDefined
                                  : user.descperfil,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.pushNamed('edit-profile', extra: user);
                      },
                      icon: const Icon(Icons.edit),
                      label: Text(l10n.edit_profile),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                            title: Text(l10n.logoutButton),
                            content: Text(l10n.logoutDialogContent),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(),
                                child: Text(l10n.cancelButton),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(dialogContext).pop();
                                  context.read<AuthBloc>().add(
                                    const LogoutEvent(),
                                  );
                                },
                                child: Text(l10n.logoutButton),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.logout),
                      label: Text(l10n.logoutButton),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              AuthError(:final code) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(l10n.messageFor(code)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(const CheckAuthEvent());
                      },
                      child: Text(l10n.retryButton),
                    ),
                  ],
                ),
              ),
              AuthInitial() ||
              Unauthenticated() ||
              UserUpdated() => const SizedBox.shrink(),
            };
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
