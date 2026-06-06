import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  const LoginEvent({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

final class RegisterEvent extends AuthEvent {
  final String name;
  final String login;
  final String email;
  final String password;

  const RegisterEvent({
    required this.name,
    required this.login,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, login, email, password];
}

final class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

final class UpdateUserEvent extends AuthEvent {
  final String nome;
  final String login;
  final String? senha;

  const UpdateUserEvent({required this.nome, required this.login, this.senha});

  @override
  List<Object?> get props => [nome, login, senha];
}

final class CheckAuthEvent extends AuthEvent {
  const CheckAuthEvent();
}
