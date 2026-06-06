import 'package:equatable/equatable.dart';
import '../../user/model/user_model.dart';

sealed class UserState extends Equatable {
  const UserState();
}

final class UserLoadingState extends UserState {
  const UserLoadingState();
  @override
  List<Object?> get props => [];
}

final class UserLoadedState extends UserState {
  const UserLoadedState(this.users);
  final List<UserModel> users;
  @override
  List<Object?> get props => [users];
}

final class UserErrorState extends UserState {
  const UserErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
