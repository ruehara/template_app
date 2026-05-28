import 'package:equatable/equatable.dart';
import 'package:template_app/core/database/tables/schema.drift.dart';

sealed class ContatoState extends Equatable {
  const ContatoState();
}

final class ContatoLoadingState extends ContatoState {
  const ContatoLoadingState();
  @override
  List<Object?> get props => [];
}

final class ContatoLoadedState extends ContatoState {
  const ContatoLoadedState(this.contatos);
  final List<Usuario>? contatos;
  @override
  List<Object?> get props => [contatos];
}

final class ContatoErrorState extends ContatoState {
  const ContatoErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
