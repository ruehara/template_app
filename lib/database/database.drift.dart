// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:template_app/database/tables/tafunidade.drift.dart' as i1;
import 'package:template_app/database/tables/tafperfil.drift.dart' as i2;
import 'package:template_app/database/tables/tafequipe.drift.dart' as i3;
import 'package:template_app/database/tables/tafusuario.drift.dart' as i4;

abstract class $Database extends i0.GeneratedDatabase {
  $Database(i0.QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final i1.Tafunidade tafunidade = i1.Tafunidade(this);
  late final i2.Tafperfil tafperfil = i2.Tafperfil(this);
  late final i3.Tafequipe tafequipe = i3.Tafequipe(this);
  late final i4.Tafusuario tafusuario = i4.Tafusuario(this);
  @override
  Iterable<i0.TableInfo<i0.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<i0.TableInfo<i0.Table, Object?>>();
  @override
  List<i0.DatabaseSchemaEntity> get allSchemaEntities => [
    tafunidade,
    tafperfil,
    tafequipe,
    tafusuario,
  ];
}

class $DatabaseManager {
  final $Database _db;
  $DatabaseManager(this._db);
  i1.$TafunidadeTableManager get tafunidade =>
      i1.$TafunidadeTableManager(_db, _db.tafunidade);
  i2.$TafperfilTableManager get tafperfil =>
      i2.$TafperfilTableManager(_db, _db.tafperfil);
  i3.$TafequipeTableManager get tafequipe =>
      i3.$TafequipeTableManager(_db, _db.tafequipe);
  i4.$TafusuarioTableManager get tafusuario =>
      i4.$TafusuarioTableManager(_db, _db.tafusuario);
}
