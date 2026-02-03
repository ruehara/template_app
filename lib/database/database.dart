import 'package:drift/drift.dart';
import 'connection/connection.dart';
import 'database.drift.dart';
import 'tables/schema.drift.dart';

@DriftDatabase(
  include: {'tables/schema.drift'},
  //daos: [MyAccessor],
)
class Database extends $Database {
  Database(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: ((m, from, to) async {
        await customStatement('PRAGMA foreign_keys = OFF');
        for (var step = from + 1; step <= to; step++) {
          switch (step) {
            // case 2:
            //   // column was added in version 2.
            //   await m.addColumn(teste, teste.teste2);
            //   break;
            // case 3:
            //   // column was added in version 3.
            //   await m.addColumn(teste, teste.teste3);
            //   break;
            // case 4:
            //   // column was added in version 4.
            //   await m.addColumn(teste, teste.teste4);
            //   break;
            // case 5:
            //   // column was added in version 4.
            //   await m.addColumn(teste, teste.teste5);
            //   break;
          }
        }
      }),
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');

        if (details.wasCreated) {
          await batch((b) {
            b.insert(
              tafperfil,
              TafperfilCompanion.insert(
                codperfil: '01',
                descperfil: 'Administrador',
              ),
            );
            b.insert(
              tafunidade,
              TafunidadeCompanion.insert(
                codunidade: '01',
                descunidade: 'Unidade 01',
              ),
            );
            b.insert(
              tafequipe,
              TafequipeCompanion.insert(
                codequipe: '01',
                desequipe: 'Equipe 01',
                codunidade: '01',
                cdeqpai: '01',
              ),
            );
            b.insert(
              tafusuario,
              TafusuarioCompanion.insert(
                codusuario: '0001',
                codunidade: '01',
                codperfil: '01',
                codequipe: '01',
                descnome: 'Rodrigo Uehara',
                desclogin: 'rodrigo',
                descsenha: '123456',
                descemail: 'rodrigo@email.com',
              ),
            );
          });
        }
        await validateDatabaseSchema(this);
      },
    );
  }
}
