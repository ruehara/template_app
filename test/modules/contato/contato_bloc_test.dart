import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:template_app/core/database/tables/schema.drift.dart';
import 'package:template_app/modules/contato/blocs/contato_bloc.dart';
import 'package:template_app/modules/contato/blocs/contato_events.dart';
import 'package:template_app/modules/contato/blocs/contato_state.dart';
import 'package:template_app/modules/contato/repository/i_contato_repository.dart';

class MockContatoRepository extends Mock implements IContatoRepository {}

void main() {
  late ContatoBloc contatoBloc;
  late MockContatoRepository mockContatoRepository;

  final testContatos = [
    const Usuario(
      codusuario: '0001',
      codunidade: '01',
      codperfil: '01',
      codequipe: '01',
      descnome: 'Rodrigo Uehara',
      desclogin: 'rodrigo',
      descsenha: 'hashed',
      descemail: 'rodrigo@email.com',
    ),
  ];

  setUp(() {
    mockContatoRepository = MockContatoRepository();
    contatoBloc = ContatoBloc(mockContatoRepository);
  });

  tearDown(() {
    contatoBloc.close();
  });

  group('ContatoBloc - LoadContatoEvent', () {
    blocTest<ContatoBloc, ContatoState>(
      'emits [ContatoLoadingState, ContatoLoadedState] when getContatos succeeds',
      build: () {
        when(
          () => mockContatoRepository.getContatos(),
        ).thenAnswer((_) async => testContatos);
        return contatoBloc;
      },
      act: (bloc) => bloc.add(const LoadContatoEvent()),
      expect: () => [
        isA<ContatoLoadingState>(),
        isA<ContatoLoadedState>().having(
          (state) => state.contatos,
          'contatos',
          equals(testContatos),
        ),
      ],
      verify: (_) {
        verify(() => mockContatoRepository.getContatos()).called(1);
      },
    );

    blocTest<ContatoBloc, ContatoState>(
      'emits [ContatoLoadingState, ContatoErrorState] when getContatos throws',
      build: () {
        when(
          () => mockContatoRepository.getContatos(),
        ).thenThrow(Exception('Database error'));
        return contatoBloc;
      },
      act: (bloc) => bloc.add(const LoadContatoEvent()),
      expect: () => [
        isA<ContatoLoadingState>(),
        isA<ContatoErrorState>().having(
          (state) => state.error,
          'error',
          contains('Database error'),
        ),
      ],
    );
  });
}
