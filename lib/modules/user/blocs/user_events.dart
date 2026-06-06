import 'package:equatable/equatable.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

final class LoadUserEvent extends UserEvent {
  const LoadUserEvent();
  @override
  List<Object?> get props => [];
}
