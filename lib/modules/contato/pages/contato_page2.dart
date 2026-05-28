import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template_app/core/database/database.dart';
import 'package:template_app/core/database/tables/schema.drift.dart';
import 'package:template_app/core/services/localization/l10n.dart';
import '../contato.dart';

class ContatoPage2 extends StatelessWidget {
  const ContatoPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IContatoRepository>(
      create: (context) =>
          ContatoRepository(database: GetIt.instance<Database>()),
      child: BlocProvider(
        create: (context) =>
            ContatoBloc(RepositoryProvider.of<IContatoRepository>(context))
              ..add(const LoadContatoEvent()),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(context.l10n.list_title),
          ),
          body: BlocBuilder<ContatoBloc, ContatoState>(
            builder: (context, state) {
              if (state is ContatoLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ContatoLoadedState) {
                final List<Usuario>? userList =
                    state.contatos; //state.contatos;
                return ListView.builder(
                  itemCount: userList?.length, //userList
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 1.5,
                      child: ListTile(
                        mouseCursor: SystemMouseCursors.click,
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        title: Text('${userList?[index].descnome}'),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: Text(context.l10n.errorLoadingList));
              }
            },
          ),
          floatingActionButton: FloatingActionButton.small(
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
