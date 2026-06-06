import 'package:equatable/equatable.dart';

sealed class ContatoEvent extends Equatable {
  const ContatoEvent();

  @override
  List<Object?> get props => [];
}

final class LoadContatoEvent extends ContatoEvent {
  const LoadContatoEvent();
  @override
  List<Object?> get props => [];
}
