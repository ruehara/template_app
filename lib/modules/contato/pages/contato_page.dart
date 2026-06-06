import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template_app/core/database/database.dart';
import 'package:template_app/core/services/localization/l10n.dart';
import '../contato.dart';

class ContatoPage extends StatelessWidget {
  const ContatoPage({super.key});

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
              return switch (state) {
                ContatoLoadingState() => const Center(
                  child: CircularProgressIndicator(),
                ),
                ContatoLoadedState(:final contatos) => ListView.builder(
                  itemCount: contatos.length,
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 1.5,
                      child: ListTile(
                        mouseCursor: SystemMouseCursors.click,
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        title: Text(contatos[index].descnome),
                      ),
                    );
                  },
                ),
                ContatoErrorState() => Center(
                  child: Text(context.l10n.errorLoadingList),
                ),
              };
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
