import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/modules/user/blocs/user_events.dart';
import 'package:template_app/modules/user/blocs/user_states.dart';
import 'package:template_app/modules/user/repository/i_user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository _userRepository;

  UserBloc(this._userRepository) : super(const UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(const UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
