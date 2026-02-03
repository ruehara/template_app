// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:template_app/database/tables/schema.drift.dart' as i1;

abstract class $Database extends i0.GeneratedDatabase {
  $Database(i0.QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final i1.Tafunidade tafunidade = i1.Tafunidade(this);
  late final i1.Tafperfil tafperfil = i1.Tafperfil(this);
  late final i1.Tafequipe tafequipe = i1.Tafequipe(this);
  late final i1.Tafparamglobal tafparamglobal = i1.Tafparamglobal(this);
  late final i1.Tafparamperfil tafparamperfil = i1.Tafparamperfil(this);
  late final i1.Tafusuario tafusuario = i1.Tafusuario(this);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [
    tafunidade,
    tafperfil,
    tafequipe,
    tafparamglobal,
    tafparamperfil,
    tafusuario,
  ];
}

class $DatabaseManager {
  final $Database _db;
  $DatabaseManager(this._db);
  i1.$TafunidadeTableManager get tafunidade =>
      i1.$TafunidadeTableManager(_db, _db.tafunidade);
  i1.$TafperfilTableManager get tafperfil =>
      i1.$TafperfilTableManager(_db, _db.tafperfil);
  i1.$TafequipeTableManager get tafequipe =>
      i1.$TafequipeTableManager(_db, _db.tafequipe);
  i1.$TafparamglobalTableManager get tafparamglobal =>
      i1.$TafparamglobalTableManager(_db, _db.tafparamglobal);
  i1.$TafparamperfilTableManager get tafparamperfil =>
      i1.$TafparamperfilTableManager(_db, _db.tafparamperfil);
  i1.$TafusuarioTableManager get tafusuario =>
      i1.$TafusuarioTableManager(_db, _db.tafusuario);
}
