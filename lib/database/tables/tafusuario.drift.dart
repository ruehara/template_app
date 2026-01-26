// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:template_app/database/tables/tafusuario.drift.dart' as i1;
import 'package:template_app/database/helpers/converters.dart' as i2;
import 'package:template_app/database/tables/tafunidade.drift.dart' as i3;
import 'package:drift/internal/modular.dart' as i4;
import 'package:template_app/database/tables/tafperfil.drift.dart' as i5;
import 'package:template_app/database/tables/tafequipe.drift.dart' as i6;

typedef $TafusuarioCreateCompanionBuilder =
    i1.TafusuarioCompanion Function({
      required String codusuario,
      required String codunidade,
      required String codperfil,
      required String codequipe,
      required String descnome,
      required String desclogin,
      required String descsenha,
      required String descemail,
      i0.Value<int> rowid,
    });
typedef $TafusuarioUpdateCompanionBuilder =
    i1.TafusuarioCompanion Function({
      i0.Value<String> codusuario,
      i0.Value<String> codunidade,
      i0.Value<String> codperfil,
      i0.Value<String> codequipe,
      i0.Value<String> descnome,
      i0.Value<String> desclogin,
      i0.Value<String> descsenha,
      i0.Value<String> descemail,
      i0.Value<int> rowid,
    });

final class $TafusuarioReferences
    extends i0.BaseReferences<i0.GeneratedDatabase, i1.Tafusuario, i1.Usuario> {
  $TafusuarioReferences(super.$_db, super.$_table, super.$_typedResult);

  static i3.Tafunidade _codunidadeTable(i0.GeneratedDatabase db) =>
      i4.ReadDatabaseContainer(db)
          .resultSet<i3.Tafunidade>('tafunidade')
          .createAlias(
            i0.$_aliasNameGenerator(
              i4.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafusuario>('tafusuario').codunidade,
              i4.ReadDatabaseContainer(
                db,
              ).resultSet<i3.Tafunidade>('tafunidade').codunidade,
            ),
          );

  i3.$TafunidadeProcessedTableManager get codunidade {
    final $_column = $_itemColumn<String>('codunidade')!;

    final manager = i3
        .$TafunidadeTableManager(
          $_db,
          i4.ReadDatabaseContainer($_db).resultSet<i3.Tafunidade>('tafunidade'),
        )
        .filter((f) => f.codunidade.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codunidadeTable($_db));
    if (item == null) return manager;
    return i0.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static i5.Tafperfil _codperfilTable(i0.GeneratedDatabase db) =>
      i4.ReadDatabaseContainer(db)
          .resultSet<i5.Tafperfil>('tafperfil')
          .createAlias(
            i0.$_aliasNameGenerator(
              i4.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafusuario>('tafusuario').codperfil,
              i4.ReadDatabaseContainer(
                db,
              ).resultSet<i5.Tafperfil>('tafperfil').codperfil,
            ),
          );

  i5.$TafperfilProcessedTableManager get codperfil {
    final $_column = $_itemColumn<String>('codperfil')!;

    final manager = i5
        .$TafperfilTableManager(
          $_db,
          i4.ReadDatabaseContainer($_db).resultSet<i5.Tafperfil>('tafperfil'),
        )
        .filter((f) => f.codperfil.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codperfilTable($_db));
    if (item == null) return manager;
    return i0.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static i6.Tafequipe _codequipeTable(i0.GeneratedDatabase db) =>
      i4.ReadDatabaseContainer(db)
          .resultSet<i6.Tafequipe>('tafequipe')
          .createAlias(
            i0.$_aliasNameGenerator(
              i4.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafusuario>('tafusuario').codequipe,
              i4.ReadDatabaseContainer(
                db,
              ).resultSet<i6.Tafequipe>('tafequipe').codequipe,
            ),
          );

  i6.$TafequipeProcessedTableManager get codequipe {
    final $_column = $_itemColumn<String>('codequipe')!;

    final manager = i6
        .$TafequipeTableManager(
          $_db,
          i4.ReadDatabaseContainer($_db).resultSet<i6.Tafequipe>('tafequipe'),
        )
        .filter((f) => f.codequipe.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codequipeTable($_db));
    if (item == null) return manager;
    return i0.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $TafusuarioFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafusuario> {
  $TafusuarioFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnWithTypeConverterFilters<String, String, String> get codusuario =>
      $composableBuilder(
        column: $table.codusuario,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get descnome =>
      $composableBuilder(
        column: $table.descnome,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get desclogin =>
      $composableBuilder(
        column: $table.desclogin,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get descsenha =>
      $composableBuilder(
        column: $table.descsenha,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get descemail =>
      $composableBuilder(
        column: $table.descemail,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i3.$TafunidadeFilterComposer get codunidade {
    final i3.$TafunidadeFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i4.ReadDatabaseContainer(
        $db,
      ).resultSet<i3.Tafunidade>('tafunidade'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i3.$TafunidadeFilterComposer(
            $db: $db,
            $table: i4.ReadDatabaseContainer(
              $db,
            ).resultSet<i3.Tafunidade>('tafunidade'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i5.$TafperfilFilterComposer get codperfil {
    final i5.$TafperfilFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codperfil,
      referencedTable: i4.ReadDatabaseContainer(
        $db,
      ).resultSet<i5.Tafperfil>('tafperfil'),
      getReferencedColumn: (t) => t.codperfil,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i5.$TafperfilFilterComposer(
            $db: $db,
            $table: i4.ReadDatabaseContainer(
              $db,
            ).resultSet<i5.Tafperfil>('tafperfil'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i6.$TafequipeFilterComposer get codequipe {
    final i6.$TafequipeFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codequipe,
      referencedTable: i4.ReadDatabaseContainer(
        $db,
      ).resultSet<i6.Tafequipe>('tafequipe'),
      getReferencedColumn: (t) => t.codequipe,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i6.$TafequipeFilterComposer(
            $db: $db,
            $table: i4.ReadDatabaseContainer(
              $db,
            ).resultSet<i6.Tafequipe>('tafequipe'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TafusuarioOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafusuario> {
  $TafusuarioOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get codusuario => $composableBuilder(
    column: $table.codusuario,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get descnome => $composableBuilder(
    column: $table.descnome,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get desclogin => $composableBuilder(
    column: $table.desclogin,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get descsenha => $composableBuilder(
    column: $table.descsenha,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get descemail => $composableBuilder(
    column: $table.descemail,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i3.$TafunidadeOrderingComposer get codunidade {
    final i3.$TafunidadeOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i4.ReadDatabaseContainer(
        $db,
      ).resultSet<i3.Tafunidade>('tafunidade'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i3.$TafunidadeOrderingComposer(
            $db: $db,
            $table: i4.ReadDatabaseContainer(
              $db,
            ).resultSet<i3.Tafunidade>('tafunidade'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i5.$TafperfilOrderingComposer get codperfil {
    final i5.$TafperfilOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codperfil,
      referencedTable: i4.ReadDatabaseContainer(
        $db,
      ).resultSet<i5.Tafperfil>('tafperfil'),
      getReferencedColumn: (t) => t.codperfil,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i5.$TafperfilOrderingComposer(
            $db: $db,
            $table: i4.ReadDatabaseContainer(
              $db,
            ).resultSet<i5.Tafperfil>('tafperfil'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i6.$TafequipeOrderingComposer get codequipe {
    final i6.$TafequipeOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codequipe,
      referencedTable: i4.ReadDatabaseContainer(
        $db,
      ).resultSet<i6.Tafequipe>('tafequipe'),
      getReferencedColumn: (t) => t.codequipe,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i6.$TafequipeOrderingComposer(
            $db: $db,
            $table: i4.ReadDatabaseContainer(
              $db,
            ).resultSet<i6.Tafequipe>('tafequipe'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TafusuarioAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafusuario> {
  $TafusuarioAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumnWithTypeConverter<String, String> get codusuario =>
      $composableBuilder(
        column: $table.codusuario,
        builder: (column) => column,
      );

  i0.GeneratedColumnWithTypeConverter<String, String> get descnome =>
      $composableBuilder(column: $table.descnome, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get desclogin =>
      $composableBuilder(column: $table.desclogin, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get descsenha =>
      $composableBuilder(column: $table.descsenha, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get descemail =>
      $composableBuilder(column: $table.descemail, builder: (column) => column);

  i3.$TafunidadeAnnotationComposer get codunidade {
    final i3.$TafunidadeAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i4.ReadDatabaseContainer(
        $db,
      ).resultSet<i3.Tafunidade>('tafunidade'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i3.$TafunidadeAnnotationComposer(
            $db: $db,
            $table: i4.ReadDatabaseContainer(
              $db,
            ).resultSet<i3.Tafunidade>('tafunidade'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i5.$TafperfilAnnotationComposer get codperfil {
    final i5.$TafperfilAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codperfil,
      referencedTable: i4.ReadDatabaseContainer(
        $db,
      ).resultSet<i5.Tafperfil>('tafperfil'),
      getReferencedColumn: (t) => t.codperfil,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i5.$TafperfilAnnotationComposer(
            $db: $db,
            $table: i4.ReadDatabaseContainer(
              $db,
            ).resultSet<i5.Tafperfil>('tafperfil'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i6.$TafequipeAnnotationComposer get codequipe {
    final i6.$TafequipeAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codequipe,
      referencedTable: i4.ReadDatabaseContainer(
        $db,
      ).resultSet<i6.Tafequipe>('tafequipe'),
      getReferencedColumn: (t) => t.codequipe,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i6.$TafequipeAnnotationComposer(
            $db: $db,
            $table: i4.ReadDatabaseContainer(
              $db,
            ).resultSet<i6.Tafequipe>('tafequipe'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TafusuarioTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Tafusuario,
          i1.Usuario,
          i1.$TafusuarioFilterComposer,
          i1.$TafusuarioOrderingComposer,
          i1.$TafusuarioAnnotationComposer,
          $TafusuarioCreateCompanionBuilder,
          $TafusuarioUpdateCompanionBuilder,
          (i1.Usuario, i1.$TafusuarioReferences),
          i1.Usuario,
          i0.PrefetchHooks Function({
            bool codunidade,
            bool codperfil,
            bool codequipe,
          })
        > {
  $TafusuarioTableManager(i0.GeneratedDatabase db, i1.Tafusuario table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$TafusuarioFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$TafusuarioOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$TafusuarioAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> codusuario = const i0.Value.absent(),
                i0.Value<String> codunidade = const i0.Value.absent(),
                i0.Value<String> codperfil = const i0.Value.absent(),
                i0.Value<String> codequipe = const i0.Value.absent(),
                i0.Value<String> descnome = const i0.Value.absent(),
                i0.Value<String> desclogin = const i0.Value.absent(),
                i0.Value<String> descsenha = const i0.Value.absent(),
                i0.Value<String> descemail = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafusuarioCompanion(
                codusuario: codusuario,
                codunidade: codunidade,
                codperfil: codperfil,
                codequipe: codequipe,
                descnome: descnome,
                desclogin: desclogin,
                descsenha: descsenha,
                descemail: descemail,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codusuario,
                required String codunidade,
                required String codperfil,
                required String codequipe,
                required String descnome,
                required String desclogin,
                required String descsenha,
                required String descemail,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafusuarioCompanion.insert(
                codusuario: codusuario,
                codunidade: codunidade,
                codperfil: codperfil,
                codequipe: codequipe,
                descnome: descnome,
                desclogin: desclogin,
                descsenha: descsenha,
                descemail: descemail,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  i1.$TafusuarioReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({codunidade = false, codperfil = false, codequipe = false}) {
                return i0.PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends i0.TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (codunidade) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.codunidade,
                                    referencedTable: i1.$TafusuarioReferences
                                        ._codunidadeTable(db),
                                    referencedColumn: i1.$TafusuarioReferences
                                        ._codunidadeTable(db)
                                        .codunidade,
                                  )
                                  as T;
                        }
                        if (codperfil) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.codperfil,
                                    referencedTable: i1.$TafusuarioReferences
                                        ._codperfilTable(db),
                                    referencedColumn: i1.$TafusuarioReferences
                                        ._codperfilTable(db)
                                        .codperfil,
                                  )
                                  as T;
                        }
                        if (codequipe) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.codequipe,
                                    referencedTable: i1.$TafusuarioReferences
                                        ._codequipeTable(db),
                                    referencedColumn: i1.$TafusuarioReferences
                                        ._codequipeTable(db)
                                        .codequipe,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $TafusuarioProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Tafusuario,
      i1.Usuario,
      i1.$TafusuarioFilterComposer,
      i1.$TafusuarioOrderingComposer,
      i1.$TafusuarioAnnotationComposer,
      $TafusuarioCreateCompanionBuilder,
      $TafusuarioUpdateCompanionBuilder,
      (i1.Usuario, i1.$TafusuarioReferences),
      i1.Usuario,
      i0.PrefetchHooks Function({
        bool codunidade,
        bool codperfil,
        bool codequipe,
      })
    >;

class Tafusuario extends i0.Table with i0.TableInfo<Tafusuario, i1.Usuario> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Tafusuario(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumnWithTypeConverter<String, String> codusuario =
      i0.GeneratedColumn<String>(
        'codusuario',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      ).withConverter<String>(i1.Tafusuario.$convertercodusuario);
  late final i0.GeneratedColumnWithTypeConverter<String, String> codunidade =
      i0.GeneratedColumn<String>(
        'codunidade',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL REFERENCES tafunidade(codunidade)',
      ).withConverter<String>(i1.Tafusuario.$convertercodunidade);
  late final i0.GeneratedColumnWithTypeConverter<String, String> codperfil =
      i0.GeneratedColumn<String>(
        'codperfil',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL REFERENCES tafperfil(codperfil)',
      ).withConverter<String>(i1.Tafusuario.$convertercodperfil);
  late final i0.GeneratedColumnWithTypeConverter<String, String> codequipe =
      i0.GeneratedColumn<String>(
        'codequipe',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL REFERENCES tafequipe(codequipe)',
      ).withConverter<String>(i1.Tafusuario.$convertercodequipe);
  late final i0.GeneratedColumnWithTypeConverter<String, String> descnome =
      i0.GeneratedColumn<String>(
        'descnome',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafusuario.$converterdescnome);
  late final i0.GeneratedColumnWithTypeConverter<String, String> desclogin =
      i0.GeneratedColumn<String>(
        'desclogin',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafusuario.$converterdesclogin);
  late final i0.GeneratedColumnWithTypeConverter<String, String> descsenha =
      i0.GeneratedColumn<String>(
        'descsenha',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafusuario.$converterdescsenha);
  late final i0.GeneratedColumnWithTypeConverter<String, String> descemail =
      i0.GeneratedColumn<String>(
        'descemail',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafusuario.$converterdescemail);
  @override
  List<i0.GeneratedColumn> get $columns => [
    codusuario,
    codunidade,
    codperfil,
    codequipe,
    descnome,
    desclogin,
    descsenha,
    descemail,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tafusuario';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {codusuario};
  @override
  i1.Usuario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Usuario(
      codusuario: i1.Tafusuario.$convertercodusuario.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}codusuario'],
        )!,
      ),
      codunidade: i1.Tafusuario.$convertercodunidade.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}codunidade'],
        )!,
      ),
      codperfil: i1.Tafusuario.$convertercodperfil.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}codperfil'],
        )!,
      ),
      codequipe: i1.Tafusuario.$convertercodequipe.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}codequipe'],
        )!,
      ),
      descnome: i1.Tafusuario.$converterdescnome.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}descnome'],
        )!,
      ),
      desclogin: i1.Tafusuario.$converterdesclogin.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}desclogin'],
        )!,
      ),
      descsenha: i1.Tafusuario.$converterdescsenha.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}descsenha'],
        )!,
      ),
      descemail: i1.Tafusuario.$converterdescemail.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}descemail'],
        )!,
      ),
    );
  }

  @override
  Tafusuario createAlias(String alias) {
    return Tafusuario(attachedDatabase, alias);
  }

  static i0.TypeConverter<String, String> $convertercodusuario =
      const i2.TextConverter(36);
  static i0.TypeConverter<String, String> $convertercodunidade =
      const i2.TextConverter(36);
  static i0.TypeConverter<String, String> $convertercodperfil =
      const i2.TextConverter(36);
  static i0.TypeConverter<String, String> $convertercodequipe =
      const i2.TextConverter(36);
  static i0.TypeConverter<String, String> $converterdescnome =
      const i2.TextConverter(50);
  static i0.TypeConverter<String, String> $converterdesclogin =
      const i2.TextConverter(50);
  static i0.TypeConverter<String, String> $converterdescsenha =
      const i2.TextConverter(255);
  static i0.TypeConverter<String, String> $converterdescemail =
      const i2.TextConverter(100);
  @override
  bool get dontWriteConstraints => true;
}

class Usuario extends i0.DataClass implements i0.Insertable<i1.Usuario> {
  final String codusuario;
  final String codunidade;
  final String codperfil;
  final String codequipe;
  final String descnome;
  final String desclogin;
  final String descsenha;
  final String descemail;
  const Usuario({
    required this.codusuario,
    required this.codunidade,
    required this.codperfil,
    required this.codequipe,
    required this.descnome,
    required this.desclogin,
    required this.descsenha,
    required this.descemail,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    {
      map['codusuario'] = i0.Variable<String>(
        i1.Tafusuario.$convertercodusuario.toSql(codusuario),
      );
    }
    {
      map['codunidade'] = i0.Variable<String>(
        i1.Tafusuario.$convertercodunidade.toSql(codunidade),
      );
    }
    {
      map['codperfil'] = i0.Variable<String>(
        i1.Tafusuario.$convertercodperfil.toSql(codperfil),
      );
    }
    {
      map['codequipe'] = i0.Variable<String>(
        i1.Tafusuario.$convertercodequipe.toSql(codequipe),
      );
    }
    {
      map['descnome'] = i0.Variable<String>(
        i1.Tafusuario.$converterdescnome.toSql(descnome),
      );
    }
    {
      map['desclogin'] = i0.Variable<String>(
        i1.Tafusuario.$converterdesclogin.toSql(desclogin),
      );
    }
    {
      map['descsenha'] = i0.Variable<String>(
        i1.Tafusuario.$converterdescsenha.toSql(descsenha),
      );
    }
    {
      map['descemail'] = i0.Variable<String>(
        i1.Tafusuario.$converterdescemail.toSql(descemail),
      );
    }
    return map;
  }

  i1.TafusuarioCompanion toCompanion(bool nullToAbsent) {
    return i1.TafusuarioCompanion(
      codusuario: i0.Value(codusuario),
      codunidade: i0.Value(codunidade),
      codperfil: i0.Value(codperfil),
      codequipe: i0.Value(codequipe),
      descnome: i0.Value(descnome),
      desclogin: i0.Value(desclogin),
      descsenha: i0.Value(descsenha),
      descemail: i0.Value(descemail),
    );
  }

  factory Usuario.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Usuario(
      codusuario: serializer.fromJson<String>(json['codusuario']),
      codunidade: serializer.fromJson<String>(json['codunidade']),
      codperfil: serializer.fromJson<String>(json['codperfil']),
      codequipe: serializer.fromJson<String>(json['codequipe']),
      descnome: serializer.fromJson<String>(json['descnome']),
      desclogin: serializer.fromJson<String>(json['desclogin']),
      descsenha: serializer.fromJson<String>(json['descsenha']),
      descemail: serializer.fromJson<String>(json['descemail']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codusuario': serializer.toJson<String>(codusuario),
      'codunidade': serializer.toJson<String>(codunidade),
      'codperfil': serializer.toJson<String>(codperfil),
      'codequipe': serializer.toJson<String>(codequipe),
      'descnome': serializer.toJson<String>(descnome),
      'desclogin': serializer.toJson<String>(desclogin),
      'descsenha': serializer.toJson<String>(descsenha),
      'descemail': serializer.toJson<String>(descemail),
    };
  }

  i1.Usuario copyWith({
    String? codusuario,
    String? codunidade,
    String? codperfil,
    String? codequipe,
    String? descnome,
    String? desclogin,
    String? descsenha,
    String? descemail,
  }) => i1.Usuario(
    codusuario: codusuario ?? this.codusuario,
    codunidade: codunidade ?? this.codunidade,
    codperfil: codperfil ?? this.codperfil,
    codequipe: codequipe ?? this.codequipe,
    descnome: descnome ?? this.descnome,
    desclogin: desclogin ?? this.desclogin,
    descsenha: descsenha ?? this.descsenha,
    descemail: descemail ?? this.descemail,
  );
  Usuario copyWithCompanion(i1.TafusuarioCompanion data) {
    return Usuario(
      codusuario: data.codusuario.present
          ? data.codusuario.value
          : this.codusuario,
      codunidade: data.codunidade.present
          ? data.codunidade.value
          : this.codunidade,
      codperfil: data.codperfil.present ? data.codperfil.value : this.codperfil,
      codequipe: data.codequipe.present ? data.codequipe.value : this.codequipe,
      descnome: data.descnome.present ? data.descnome.value : this.descnome,
      desclogin: data.desclogin.present ? data.desclogin.value : this.desclogin,
      descsenha: data.descsenha.present ? data.descsenha.value : this.descsenha,
      descemail: data.descemail.present ? data.descemail.value : this.descemail,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Usuario(')
          ..write('codusuario: $codusuario, ')
          ..write('codunidade: $codunidade, ')
          ..write('codperfil: $codperfil, ')
          ..write('codequipe: $codequipe, ')
          ..write('descnome: $descnome, ')
          ..write('desclogin: $desclogin, ')
          ..write('descsenha: $descsenha, ')
          ..write('descemail: $descemail')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    codusuario,
    codunidade,
    codperfil,
    codequipe,
    descnome,
    desclogin,
    descsenha,
    descemail,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Usuario &&
          other.codusuario == this.codusuario &&
          other.codunidade == this.codunidade &&
          other.codperfil == this.codperfil &&
          other.codequipe == this.codequipe &&
          other.descnome == this.descnome &&
          other.desclogin == this.desclogin &&
          other.descsenha == this.descsenha &&
          other.descemail == this.descemail);
}

class TafusuarioCompanion extends i0.UpdateCompanion<i1.Usuario> {
  final i0.Value<String> codusuario;
  final i0.Value<String> codunidade;
  final i0.Value<String> codperfil;
  final i0.Value<String> codequipe;
  final i0.Value<String> descnome;
  final i0.Value<String> desclogin;
  final i0.Value<String> descsenha;
  final i0.Value<String> descemail;
  final i0.Value<int> rowid;
  const TafusuarioCompanion({
    this.codusuario = const i0.Value.absent(),
    this.codunidade = const i0.Value.absent(),
    this.codperfil = const i0.Value.absent(),
    this.codequipe = const i0.Value.absent(),
    this.descnome = const i0.Value.absent(),
    this.desclogin = const i0.Value.absent(),
    this.descsenha = const i0.Value.absent(),
    this.descemail = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  TafusuarioCompanion.insert({
    required String codusuario,
    required String codunidade,
    required String codperfil,
    required String codequipe,
    required String descnome,
    required String desclogin,
    required String descsenha,
    required String descemail,
    this.rowid = const i0.Value.absent(),
  }) : codusuario = i0.Value(codusuario),
       codunidade = i0.Value(codunidade),
       codperfil = i0.Value(codperfil),
       codequipe = i0.Value(codequipe),
       descnome = i0.Value(descnome),
       desclogin = i0.Value(desclogin),
       descsenha = i0.Value(descsenha),
       descemail = i0.Value(descemail);
  static i0.Insertable<i1.Usuario> custom({
    i0.Expression<String>? codusuario,
    i0.Expression<String>? codunidade,
    i0.Expression<String>? codperfil,
    i0.Expression<String>? codequipe,
    i0.Expression<String>? descnome,
    i0.Expression<String>? desclogin,
    i0.Expression<String>? descsenha,
    i0.Expression<String>? descemail,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (codusuario != null) 'codusuario': codusuario,
      if (codunidade != null) 'codunidade': codunidade,
      if (codperfil != null) 'codperfil': codperfil,
      if (codequipe != null) 'codequipe': codequipe,
      if (descnome != null) 'descnome': descnome,
      if (desclogin != null) 'desclogin': desclogin,
      if (descsenha != null) 'descsenha': descsenha,
      if (descemail != null) 'descemail': descemail,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.TafusuarioCompanion copyWith({
    i0.Value<String>? codusuario,
    i0.Value<String>? codunidade,
    i0.Value<String>? codperfil,
    i0.Value<String>? codequipe,
    i0.Value<String>? descnome,
    i0.Value<String>? desclogin,
    i0.Value<String>? descsenha,
    i0.Value<String>? descemail,
    i0.Value<int>? rowid,
  }) {
    return i1.TafusuarioCompanion(
      codusuario: codusuario ?? this.codusuario,
      codunidade: codunidade ?? this.codunidade,
      codperfil: codperfil ?? this.codperfil,
      codequipe: codequipe ?? this.codequipe,
      descnome: descnome ?? this.descnome,
      desclogin: desclogin ?? this.desclogin,
      descsenha: descsenha ?? this.descsenha,
      descemail: descemail ?? this.descemail,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (codusuario.present) {
      map['codusuario'] = i0.Variable<String>(
        i1.Tafusuario.$convertercodusuario.toSql(codusuario.value),
      );
    }
    if (codunidade.present) {
      map['codunidade'] = i0.Variable<String>(
        i1.Tafusuario.$convertercodunidade.toSql(codunidade.value),
      );
    }
    if (codperfil.present) {
      map['codperfil'] = i0.Variable<String>(
        i1.Tafusuario.$convertercodperfil.toSql(codperfil.value),
      );
    }
    if (codequipe.present) {
      map['codequipe'] = i0.Variable<String>(
        i1.Tafusuario.$convertercodequipe.toSql(codequipe.value),
      );
    }
    if (descnome.present) {
      map['descnome'] = i0.Variable<String>(
        i1.Tafusuario.$converterdescnome.toSql(descnome.value),
      );
    }
    if (desclogin.present) {
      map['desclogin'] = i0.Variable<String>(
        i1.Tafusuario.$converterdesclogin.toSql(desclogin.value),
      );
    }
    if (descsenha.present) {
      map['descsenha'] = i0.Variable<String>(
        i1.Tafusuario.$converterdescsenha.toSql(descsenha.value),
      );
    }
    if (descemail.present) {
      map['descemail'] = i0.Variable<String>(
        i1.Tafusuario.$converterdescemail.toSql(descemail.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TafusuarioCompanion(')
          ..write('codusuario: $codusuario, ')
          ..write('codunidade: $codunidade, ')
          ..write('codperfil: $codperfil, ')
          ..write('codequipe: $codequipe, ')
          ..write('descnome: $descnome, ')
          ..write('desclogin: $desclogin, ')
          ..write('descsenha: $descsenha, ')
          ..write('descemail: $descemail, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}
