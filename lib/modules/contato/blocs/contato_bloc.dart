import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/i_contato_repository.dart';
import 'contato_events.dart';
import 'contato_state.dart';

class ContatoBloc extends Bloc<ContatoEvent, ContatoState> {
  final IContatoRepository _contatoRepository;

  ContatoBloc(this._contatoRepository) : super(const ContatoLoadingState()) {
    on<LoadContatoEvent>((event, emit) async {
      emit(const ContatoLoadingState());
      try {
        final contatos = await _contatoRepository.getContatos();
        emit(ContatoLoadedState(contatos));
      } catch (e) {
        emit(ContatoErrorState(e.toString()));
      }
    });
  }
}
