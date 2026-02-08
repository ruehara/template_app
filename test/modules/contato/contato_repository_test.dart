import 'package:drift/drift.dart' hide isNotNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:template_app/core/database/database.dart';
import 'package:template_app/modules/contato/repository/contato_repository.dart';
import '../../helpers/mock_database.dart';
import '../../helpers/test_helpers.dart';

void main() {
  late ContatoRepository contatoRepository;
  late MockDatabase mockDatabase;
  late GetIt getIt;

  setUp(() {
    resetGetIt();
    getIt = GetIt.instance;
    mockDatabase = MockDatabase();

    getIt.registerSingleton<Database>(mockDatabase);
    contatoRepository = ContatoRepository();
  });

  tearDown(() {
    getIt.reset();
  });

  group('ContatoRepository - getContatos', () {
    test('should return list of usuarios when query succeeds', () async {
      // Arrange
      final mockRow1 = MockQueryRow();
      when(() => mockRow1.read<String>('codusuario')).thenReturn('0001');
      when(() => mockRow1.read<String>('descnome')).thenReturn('User One');

      final mockRow2 = MockQueryRow();
      when(() => mockRow2.read<String>('codusuario')).thenReturn('0002');
      when(() => mockRow2.read<String>('descnome')).thenReturn('User Two');

      final mockSelectable = MockSelectable<QueryRow>();
      when(
        () => mockSelectable.get(),
      ).thenAnswer((_) async => [mockRow1, mockRow2]);

      when(() => mockDatabase.customSelect(any())).thenReturn(mockSelectable);

      // Act
      final result = await contatoRepository.getContatos();

      // Assert
      expect(result, isNotNull);
      expect(result!.length, 2);
      expect(result[0].codusuario, '0001');
      expect(result[0].descnome, 'User One');
      expect(result[1].codusuario, '0002');
      expect(result[1].descnome, 'User Two');
    });

    test('should return empty list when no contatos exist', () async {
      // Arrange
      final mockSelectable = MockSelectable<QueryRow>();
      when(() => mockSelectable.get()).thenAnswer((_) async => []);

      when(() => mockDatabase.customSelect(any())).thenReturn(mockSelectable);

      // Act
      final result = await contatoRepository.getContatos();

      // Assert
      expect(result, isNotNull);
      expect(result!.length, 0);
    });
  });

  group('ContatoRepository - getStreamContatos', () {
    test('should return list of usuarios', () async {
      // Arrange
      final mockRow = MockQueryRow();
      when(() => mockRow.read<String>('codusuario')).thenReturn('0001');
      when(() => mockRow.read<String>('descnome')).thenReturn('Stream User');

      final mockSelectable = MockSelectable<QueryRow>();
      when(() => mockSelectable.get()).thenAnswer((_) async => [mockRow]);

      when(() => mockDatabase.customSelect(any())).thenReturn(mockSelectable);

      // Act
      final result = await contatoRepository.getStreamContatos();

      // Assert
      expect(result, isNotNull);
      expect(result!.length, 1);
      expect(result[0].descnome, 'Stream User');
    });
  });
}
