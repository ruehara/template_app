import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/core/services/localization/l10n.dart';

import '../blocs/user_bloc.dart';
import '../blocs/user_events.dart';
import '../blocs/user_states.dart';
import '../repository/i_user_repository.dart';
import '../repository/user_repository.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IUserRepository>(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            UserBloc(RepositoryProvider.of<IUserRepository>(context))
              ..add(const LoadUserEvent()),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(context.l10n.list_title),
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return switch (state) {
                UserLoadingState() => const Center(
                  child: CircularProgressIndicator(),
                ),
                UserLoadedState(:final users) => ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 1.5,
                      child: ListTile(
                        mouseCursor: SystemMouseCursors.click,
                        onTap: () => context.pushNamed(
                          'userdetail',
                          extra: users[index],
                        ),
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        title: Text(users[index].name),
                        subtitle: Text('${users[index].age}'),
                        leading: Hero(
                          tag: users[index].id,
                          child: CircleAvatar(
                            key: Key(users[index].id),
                            backgroundImage: NetworkImage(
                              users[index].profilePicture,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                UserErrorState() => Center(
                  child: Text(context.l10n.errorLoadingList),
                ),
              };
            },
          ),
        ),
      ),
    );
  }
}
