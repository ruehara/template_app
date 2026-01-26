import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/localization/l10n.dart';

import '../blocs/user_bloc.dart';
import '../blocs/user_events.dart';
import '../blocs/user_states.dart';
import '../model/user_model.dart';
import '../repository/user_repository.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            UserBloc(RepositoryProvider.of<UserRepository>(context))
              ..add(LoadUserEvent()),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(context.l10n.list_title),
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UserLoadedState) {
                List<UserModel> userList = state.users;
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 1.5,
                      child: ListTile(
                        mouseCursor: SystemMouseCursors.click,
                        onTap: () => context.pushNamed(
                          'userdetail',
                          extra: userList[index],
                        ),
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        title: Text(userList[index].name),
                        subtitle: Text('${userList[index].age}'),
                        leading: Hero(
                          tag: userList[index].id,
                          child: CircleAvatar(
                            key: Key(userList[index].id),
                            backgroundImage: NetworkImage(
                              userList[index].profilePicture,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('Error Loading List'));
              }
            },
          ),
        ),
      ),
    );
  }
}
