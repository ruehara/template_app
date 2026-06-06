import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/core/services/localization/l10n.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_events.dart';
import '../blocs/auth_states.dart';
import '../repository/i_auth_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        LoginEvent(
          username: _usernameController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(GetIt.instance<IAuthRepository>()),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                switch (state) {
                  case Authenticated():
                    context.goNamed('counter');
                  case AuthError(:final code):
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(context.l10n.messageFor(code)),
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

                return Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Icon(
                              Icons.lock_outline,
                              size: 80,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              l10n.loginTitle,
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: l10n.usernameLabel,
                                prefixIcon: const Icon(Icons.person),
                                border: const OutlineInputBorder(),
                              ),
                              enabled: !isLoading,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return l10n.usernameRequired;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: l10n.passwordLabel,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return l10n.passwordRequired;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () => _handleLogin(context),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      l10n.enterButton,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: isLoading
                                  ? null
                                  : () => context.pushNamed('register'),
                              child: Text(l10n.createAccountButton),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
