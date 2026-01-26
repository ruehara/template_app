import 'package:equatable/equatable.dart';

class AuthUserModel extends Equatable {
  final String codusuario;
  final String descnome;
  final String desclogin;
  final String descemail;
  final String descunidade;
  final String descperfil;

  const AuthUserModel({
    required this.codusuario,
    required this.descnome,
    required this.desclogin,
    required this.descemail,
    required this.descunidade,
    required this.descperfil,
  });

  factory AuthUserModel.fromMap(Map<String, dynamic> map) {
    return AuthUserModel(
      codusuario: map['codusuario'] as String,
      descnome: map['descnome'] as String,
      desclogin: map['desclogin'] as String,
      descemail: map['descemail'] as String,
      descunidade: map['descunidade'] as String,
      descperfil: map['descperfil'] as String,
    );
  }

  @override
  List<Object?> get props => [
    codusuario,
    descnome,
    desclogin,
    descemail,
    descunidade,
    descperfil,
  ];
}
