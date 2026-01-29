import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  const LoginEvent({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}

class RegisterEvent extends AuthEvent {
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

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class UpdateUserEvent extends AuthEvent {
  final String nome;
  final String login;
  final String? senha;

  const UpdateUserEvent({required this.nome, required this.login, this.senha});

  @override
  List<Object?> get props => [nome, login, senha];
}

class CheckAuthEvent extends AuthEvent {
  const CheckAuthEvent();
}
