// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:template_app/app/database/tables/schema.drift.dart' as i1;
import 'package:template_app/app/database/helpers/converters.dart' as i2;
import 'package:drift/internal/modular.dart' as i3;

typedef $TafunidadeCreateCompanionBuilder =
    i1.TafunidadeCompanion Function({
      required String codunidade,
      required String descunidade,
      i0.Value<int> rowid,
    });
typedef $TafunidadeUpdateCompanionBuilder =
    i1.TafunidadeCompanion Function({
      i0.Value<String> codunidade,
      i0.Value<String> descunidade,
      i0.Value<int> rowid,
    });

final class $TafunidadeReferences
    extends i0.BaseReferences<i0.GeneratedDatabase, i1.Tafunidade, i1.Unidade> {
  $TafunidadeReferences(super.$_db, super.$_table, super.$_typedResult);

  static i0.MultiTypedResultKey<i1.Tafequipe, List<i1.Equipe>>
  _tafequipeRefsTable(i0.GeneratedDatabase db) =>
      i0.MultiTypedResultKey.fromTable(
        i3.ReadDatabaseContainer(db).resultSet<i1.Tafequipe>('tafequipe'),
        aliasName: i0.$_aliasNameGenerator(
          i3.ReadDatabaseContainer(
            db,
          ).resultSet<i1.Tafunidade>('tafunidade').codunidade,
          i3.ReadDatabaseContainer(
            db,
          ).resultSet<i1.Tafequipe>('tafequipe').codunidade,
        ),
      );

  i1.$TafequipeProcessedTableManager get tafequipeRefs {
    final manager = i1
        .$TafequipeTableManager(
          $_db,
          i3.ReadDatabaseContainer($_db).resultSet<i1.Tafequipe>('tafequipe'),
        )
        .filter(
          (f) => f.codunidade.codunidade.sqlEquals(
            $_itemColumn<String>('codunidade')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_tafequipeRefsTable($_db));
    return i0.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static i0.MultiTypedResultKey<i1.Tafusuario, List<i1.Usuario>>
  _tafusuarioRefsTable(i0.GeneratedDatabase db) =>
      i0.MultiTypedResultKey.fromTable(
        i3.ReadDatabaseContainer(db).resultSet<i1.Tafusuario>('tafusuario'),
        aliasName: i0.$_aliasNameGenerator(
          i3.ReadDatabaseContainer(
            db,
          ).resultSet<i1.Tafunidade>('tafunidade').codunidade,
          i3.ReadDatabaseContainer(
            db,
          ).resultSet<i1.Tafusuario>('tafusuario').codunidade,
        ),
      );

  i1.$TafusuarioProcessedTableManager get tafusuarioRefs {
    final manager = i1
        .$TafusuarioTableManager(
          $_db,
          i3.ReadDatabaseContainer($_db).resultSet<i1.Tafusuario>('tafusuario'),
        )
        .filter(
          (f) => f.codunidade.codunidade.sqlEquals(
            $_itemColumn<String>('codunidade')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_tafusuarioRefsTable($_db));
    return i0.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $TafunidadeFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafunidade> {
  $TafunidadeFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnWithTypeConverterFilters<String, String, String> get codunidade =>
      $composableBuilder(
        column: $table.codunidade,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get descunidade =>
      $composableBuilder(
        column: $table.descunidade,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.Expression<bool> tafequipeRefs(
    i0.Expression<bool> Function(i1.$TafequipeFilterComposer f) f,
  ) {
    final i1.$TafequipeFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafequipe>('tafequipe'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafequipeFilterComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafequipe>('tafequipe'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  i0.Expression<bool> tafusuarioRefs(
    i0.Expression<bool> Function(i1.$TafusuarioFilterComposer f) f,
  ) {
    final i1.$TafusuarioFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafusuario>('tafusuario'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafusuarioFilterComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafusuario>('tafusuario'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $TafunidadeOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafunidade> {
  $TafunidadeOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get codunidade => $composableBuilder(
    column: $table.codunidade,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get descunidade => $composableBuilder(
    column: $table.descunidade,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $TafunidadeAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafunidade> {
  $TafunidadeAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumnWithTypeConverter<String, String> get codunidade =>
      $composableBuilder(
        column: $table.codunidade,
        builder: (column) => column,
      );

  i0.GeneratedColumnWithTypeConverter<String, String> get descunidade =>
      $composableBuilder(
        column: $table.descunidade,
        builder: (column) => column,
      );

  i0.Expression<T> tafequipeRefs<T extends Object>(
    i0.Expression<T> Function(i1.$TafequipeAnnotationComposer a) f,
  ) {
    final i1.$TafequipeAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafequipe>('tafequipe'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafequipeAnnotationComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafequipe>('tafequipe'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  i0.Expression<T> tafusuarioRefs<T extends Object>(
    i0.Expression<T> Function(i1.$TafusuarioAnnotationComposer a) f,
  ) {
    final i1.$TafusuarioAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafusuario>('tafusuario'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafusuarioAnnotationComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafusuario>('tafusuario'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $TafunidadeTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Tafunidade,
          i1.Unidade,
          i1.$TafunidadeFilterComposer,
          i1.$TafunidadeOrderingComposer,
          i1.$TafunidadeAnnotationComposer,
          $TafunidadeCreateCompanionBuilder,
          $TafunidadeUpdateCompanionBuilder,
          (i1.Unidade, i1.$TafunidadeReferences),
          i1.Unidade,
          i0.PrefetchHooks Function({bool tafequipeRefs, bool tafusuarioRefs})
        > {
  $TafunidadeTableManager(i0.GeneratedDatabase db, i1.Tafunidade table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$TafunidadeFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$TafunidadeOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$TafunidadeAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> codunidade = const i0.Value.absent(),
                i0.Value<String> descunidade = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafunidadeCompanion(
                codunidade: codunidade,
                descunidade: descunidade,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codunidade,
                required String descunidade,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafunidadeCompanion.insert(
                codunidade: codunidade,
                descunidade: descunidade,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  i1.$TafunidadeReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({tafequipeRefs = false, tafusuarioRefs = false}) {
                return i0.PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (tafequipeRefs)
                      i3.ReadDatabaseContainer(
                        db,
                      ).resultSet<i1.Tafequipe>('tafequipe'),
                    if (tafusuarioRefs)
                      i3.ReadDatabaseContainer(
                        db,
                      ).resultSet<i1.Tafusuario>('tafusuario'),
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (tafequipeRefs)
                        await i0.$_getPrefetchedData<
                          i1.Unidade,
                          i1.Tafunidade,
                          i1.Equipe
                        >(
                          currentTable: table,
                          referencedTable: i1.$TafunidadeReferences
                              ._tafequipeRefsTable(db),
                          managerFromTypedResult: (p0) => i1
                              .$TafunidadeReferences(db, table, p0)
                              .tafequipeRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.codunidade == item.codunidade,
                              ),
                          typedResults: items,
                        ),
                      if (tafusuarioRefs)
                        await i0.$_getPrefetchedData<
                          i1.Unidade,
                          i1.Tafunidade,
                          i1.Usuario
                        >(
                          currentTable: table,
                          referencedTable: i1.$TafunidadeReferences
                              ._tafusuarioRefsTable(db),
                          managerFromTypedResult: (p0) => i1
                              .$TafunidadeReferences(db, table, p0)
                              .tafusuarioRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.codunidade == item.codunidade,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $TafunidadeProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Tafunidade,
      i1.Unidade,
      i1.$TafunidadeFilterComposer,
      i1.$TafunidadeOrderingComposer,
      i1.$TafunidadeAnnotationComposer,
      $TafunidadeCreateCompanionBuilder,
      $TafunidadeUpdateCompanionBuilder,
      (i1.Unidade, i1.$TafunidadeReferences),
      i1.Unidade,
      i0.PrefetchHooks Function({bool tafequipeRefs, bool tafusuarioRefs})
    >;
typedef $TafperfilCreateCompanionBuilder =
    i1.TafperfilCompanion Function({
      required String codperfil,
      required String descperfil,
      i0.Value<int> rowid,
    });
typedef $TafperfilUpdateCompanionBuilder =
    i1.TafperfilCompanion Function({
      i0.Value<String> codperfil,
      i0.Value<String> descperfil,
      i0.Value<int> rowid,
    });

final class $TafperfilReferences
    extends i0.BaseReferences<i0.GeneratedDatabase, i1.Tafperfil, i1.Perfil> {
  $TafperfilReferences(super.$_db, super.$_table, super.$_typedResult);

  static i0.MultiTypedResultKey<i1.Tafusuario, List<i1.Usuario>>
  _tafusuarioRefsTable(i0.GeneratedDatabase db) =>
      i0.MultiTypedResultKey.fromTable(
        i3.ReadDatabaseContainer(db).resultSet<i1.Tafusuario>('tafusuario'),
        aliasName: i0.$_aliasNameGenerator(
          i3.ReadDatabaseContainer(
            db,
          ).resultSet<i1.Tafperfil>('tafperfil').codperfil,
          i3.ReadDatabaseContainer(
            db,
          ).resultSet<i1.Tafusuario>('tafusuario').codperfil,
        ),
      );

  i1.$TafusuarioProcessedTableManager get tafusuarioRefs {
    final manager = i1
        .$TafusuarioTableManager(
          $_db,
          i3.ReadDatabaseContainer($_db).resultSet<i1.Tafusuario>('tafusuario'),
        )
        .filter(
          (f) => f.codperfil.codperfil.sqlEquals(
            $_itemColumn<String>('codperfil')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_tafusuarioRefsTable($_db));
    return i0.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $TafperfilFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafperfil> {
  $TafperfilFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnWithTypeConverterFilters<String, String, String> get codperfil =>
      $composableBuilder(
        column: $table.codperfil,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get descperfil =>
      $composableBuilder(
        column: $table.descperfil,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.Expression<bool> tafusuarioRefs(
    i0.Expression<bool> Function(i1.$TafusuarioFilterComposer f) f,
  ) {
    final i1.$TafusuarioFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codperfil,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafusuario>('tafusuario'),
      getReferencedColumn: (t) => t.codperfil,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafusuarioFilterComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafusuario>('tafusuario'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $TafperfilOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafperfil> {
  $TafperfilOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get codperfil => $composableBuilder(
    column: $table.codperfil,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get descperfil => $composableBuilder(
    column: $table.descperfil,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $TafperfilAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafperfil> {
  $TafperfilAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumnWithTypeConverter<String, String> get codperfil =>
      $composableBuilder(column: $table.codperfil, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get descperfil =>
      $composableBuilder(
        column: $table.descperfil,
        builder: (column) => column,
      );

  i0.Expression<T> tafusuarioRefs<T extends Object>(
    i0.Expression<T> Function(i1.$TafusuarioAnnotationComposer a) f,
  ) {
    final i1.$TafusuarioAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codperfil,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafusuario>('tafusuario'),
      getReferencedColumn: (t) => t.codperfil,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafusuarioAnnotationComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafusuario>('tafusuario'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $TafperfilTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Tafperfil,
          i1.Perfil,
          i1.$TafperfilFilterComposer,
          i1.$TafperfilOrderingComposer,
          i1.$TafperfilAnnotationComposer,
          $TafperfilCreateCompanionBuilder,
          $TafperfilUpdateCompanionBuilder,
          (i1.Perfil, i1.$TafperfilReferences),
          i1.Perfil,
          i0.PrefetchHooks Function({bool tafusuarioRefs})
        > {
  $TafperfilTableManager(i0.GeneratedDatabase db, i1.Tafperfil table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$TafperfilFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$TafperfilOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$TafperfilAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> codperfil = const i0.Value.absent(),
                i0.Value<String> descperfil = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafperfilCompanion(
                codperfil: codperfil,
                descperfil: descperfil,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codperfil,
                required String descperfil,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafperfilCompanion.insert(
                codperfil: codperfil,
                descperfil: descperfil,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), i1.$TafperfilReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({tafusuarioRefs = false}) {
            return i0.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (tafusuarioRefs)
                  i3.ReadDatabaseContainer(
                    db,
                  ).resultSet<i1.Tafusuario>('tafusuario'),
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tafusuarioRefs)
                    await i0.$_getPrefetchedData<
                      i1.Perfil,
                      i1.Tafperfil,
                      i1.Usuario
                    >(
                      currentTable: table,
                      referencedTable: i1.$TafperfilReferences
                          ._tafusuarioRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          i1.$TafperfilReferences(db, table, p0).tafusuarioRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.codperfil == item.codperfil,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $TafperfilProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Tafperfil,
      i1.Perfil,
      i1.$TafperfilFilterComposer,
      i1.$TafperfilOrderingComposer,
      i1.$TafperfilAnnotationComposer,
      $TafperfilCreateCompanionBuilder,
      $TafperfilUpdateCompanionBuilder,
      (i1.Perfil, i1.$TafperfilReferences),
      i1.Perfil,
      i0.PrefetchHooks Function({bool tafusuarioRefs})
    >;
typedef $TafequipeCreateCompanionBuilder =
    i1.TafequipeCompanion Function({
      required String codequipe,
      required String desequipe,
      required String codunidade,
      required String cdeqpai,
      i0.Value<int> rowid,
    });
typedef $TafequipeUpdateCompanionBuilder =
    i1.TafequipeCompanion Function({
      i0.Value<String> codequipe,
      i0.Value<String> desequipe,
      i0.Value<String> codunidade,
      i0.Value<String> cdeqpai,
      i0.Value<int> rowid,
    });

final class $TafequipeReferences
    extends i0.BaseReferences<i0.GeneratedDatabase, i1.Tafequipe, i1.Equipe> {
  $TafequipeReferences(super.$_db, super.$_table, super.$_typedResult);

  static i1.Tafunidade _codunidadeTable(i0.GeneratedDatabase db) =>
      i3.ReadDatabaseContainer(db)
          .resultSet<i1.Tafunidade>('tafunidade')
          .createAlias(
            i0.$_aliasNameGenerator(
              i3.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafequipe>('tafequipe').codunidade,
              i3.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafunidade>('tafunidade').codunidade,
            ),
          );

  i1.$TafunidadeProcessedTableManager get codunidade {
    final $_column = $_itemColumn<String>('codunidade')!;

    final manager = i1
        .$TafunidadeTableManager(
          $_db,
          i3.ReadDatabaseContainer($_db).resultSet<i1.Tafunidade>('tafunidade'),
        )
        .filter((f) => f.codunidade.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codunidadeTable($_db));
    if (item == null) return manager;
    return i0.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static i0.MultiTypedResultKey<i1.Tafusuario, List<i1.Usuario>>
  _tafusuarioRefsTable(i0.GeneratedDatabase db) =>
      i0.MultiTypedResultKey.fromTable(
        i3.ReadDatabaseContainer(db).resultSet<i1.Tafusuario>('tafusuario'),
        aliasName: i0.$_aliasNameGenerator(
          i3.ReadDatabaseContainer(
            db,
          ).resultSet<i1.Tafequipe>('tafequipe').codequipe,
          i3.ReadDatabaseContainer(
            db,
          ).resultSet<i1.Tafusuario>('tafusuario').codequipe,
        ),
      );

  i1.$TafusuarioProcessedTableManager get tafusuarioRefs {
    final manager = i1
        .$TafusuarioTableManager(
          $_db,
          i3.ReadDatabaseContainer($_db).resultSet<i1.Tafusuario>('tafusuario'),
        )
        .filter(
          (f) => f.codequipe.codequipe.sqlEquals(
            $_itemColumn<String>('codequipe')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_tafusuarioRefsTable($_db));
    return i0.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $TafequipeFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafequipe> {
  $TafequipeFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnWithTypeConverterFilters<String, String, String> get codequipe =>
      $composableBuilder(
        column: $table.codequipe,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get desequipe =>
      $composableBuilder(
        column: $table.desequipe,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get cdeqpai =>
      $composableBuilder(
        column: $table.cdeqpai,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i1.$TafunidadeFilterComposer get codunidade {
    final i1.$TafunidadeFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafunidade>('tafunidade'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafunidadeFilterComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafunidade>('tafunidade'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i0.Expression<bool> tafusuarioRefs(
    i0.Expression<bool> Function(i1.$TafusuarioFilterComposer f) f,
  ) {
    final i1.$TafusuarioFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codequipe,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafusuario>('tafusuario'),
      getReferencedColumn: (t) => t.codequipe,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafusuarioFilterComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafusuario>('tafusuario'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $TafequipeOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafequipe> {
  $TafequipeOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get codequipe => $composableBuilder(
    column: $table.codequipe,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get desequipe => $composableBuilder(
    column: $table.desequipe,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get cdeqpai => $composableBuilder(
    column: $table.cdeqpai,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i1.$TafunidadeOrderingComposer get codunidade {
    final i1.$TafunidadeOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafunidade>('tafunidade'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafunidadeOrderingComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafunidade>('tafunidade'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TafequipeAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafequipe> {
  $TafequipeAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumnWithTypeConverter<String, String> get codequipe =>
      $composableBuilder(column: $table.codequipe, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get desequipe =>
      $composableBuilder(column: $table.desequipe, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get cdeqpai =>
      $composableBuilder(column: $table.cdeqpai, builder: (column) => column);

  i1.$TafunidadeAnnotationComposer get codunidade {
    final i1.$TafunidadeAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafunidade>('tafunidade'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafunidadeAnnotationComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafunidade>('tafunidade'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i0.Expression<T> tafusuarioRefs<T extends Object>(
    i0.Expression<T> Function(i1.$TafusuarioAnnotationComposer a) f,
  ) {
    final i1.$TafusuarioAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codequipe,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafusuario>('tafusuario'),
      getReferencedColumn: (t) => t.codequipe,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafusuarioAnnotationComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafusuario>('tafusuario'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $TafequipeTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Tafequipe,
          i1.Equipe,
          i1.$TafequipeFilterComposer,
          i1.$TafequipeOrderingComposer,
          i1.$TafequipeAnnotationComposer,
          $TafequipeCreateCompanionBuilder,
          $TafequipeUpdateCompanionBuilder,
          (i1.Equipe, i1.$TafequipeReferences),
          i1.Equipe,
          i0.PrefetchHooks Function({bool codunidade, bool tafusuarioRefs})
        > {
  $TafequipeTableManager(i0.GeneratedDatabase db, i1.Tafequipe table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$TafequipeFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$TafequipeOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$TafequipeAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> codequipe = const i0.Value.absent(),
                i0.Value<String> desequipe = const i0.Value.absent(),
                i0.Value<String> codunidade = const i0.Value.absent(),
                i0.Value<String> cdeqpai = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafequipeCompanion(
                codequipe: codequipe,
                desequipe: desequipe,
                codunidade: codunidade,
                cdeqpai: cdeqpai,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codequipe,
                required String desequipe,
                required String codunidade,
                required String cdeqpai,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafequipeCompanion.insert(
                codequipe: codequipe,
                desequipe: desequipe,
                codunidade: codunidade,
                cdeqpai: cdeqpai,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), i1.$TafequipeReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({codunidade = false, tafusuarioRefs = false}) {
                return i0.PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (tafusuarioRefs)
                      i3.ReadDatabaseContainer(
                        db,
                      ).resultSet<i1.Tafusuario>('tafusuario'),
                  ],
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
                                    referencedTable: i1.$TafequipeReferences
                                        ._codunidadeTable(db),
                                    referencedColumn: i1.$TafequipeReferences
                                        ._codunidadeTable(db)
                                        .codunidade,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (tafusuarioRefs)
                        await i0.$_getPrefetchedData<
                          i1.Equipe,
                          i1.Tafequipe,
                          i1.Usuario
                        >(
                          currentTable: table,
                          referencedTable: i1.$TafequipeReferences
                              ._tafusuarioRefsTable(db),
                          managerFromTypedResult: (p0) => i1
                              .$TafequipeReferences(db, table, p0)
                              .tafusuarioRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.codequipe == item.codequipe,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $TafequipeProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Tafequipe,
      i1.Equipe,
      i1.$TafequipeFilterComposer,
      i1.$TafequipeOrderingComposer,
      i1.$TafequipeAnnotationComposer,
      $TafequipeCreateCompanionBuilder,
      $TafequipeUpdateCompanionBuilder,
      (i1.Equipe, i1.$TafequipeReferences),
      i1.Equipe,
      i0.PrefetchHooks Function({bool codunidade, bool tafusuarioRefs})
    >;
typedef $TafparamglobalCreateCompanionBuilder =
    i1.TafparamglobalCompanion Function({
      required String codparam,
      required String descparam,
      required String valparam,
      required String tipoparam,
      i0.Value<int> rowid,
    });
typedef $TafparamglobalUpdateCompanionBuilder =
    i1.TafparamglobalCompanion Function({
      i0.Value<String> codparam,
      i0.Value<String> descparam,
      i0.Value<String> valparam,
      i0.Value<String> tipoparam,
      i0.Value<int> rowid,
    });

class $TafparamglobalFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafparamglobal> {
  $TafparamglobalFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnWithTypeConverterFilters<String, String, String> get codparam =>
      $composableBuilder(
        column: $table.codparam,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get descparam =>
      $composableBuilder(
        column: $table.descparam,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get valparam =>
      $composableBuilder(
        column: $table.valparam,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get tipoparam =>
      $composableBuilder(
        column: $table.tipoparam,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );
}

class $TafparamglobalOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafparamglobal> {
  $TafparamglobalOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get codparam => $composableBuilder(
    column: $table.codparam,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get descparam => $composableBuilder(
    column: $table.descparam,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get valparam => $composableBuilder(
    column: $table.valparam,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get tipoparam => $composableBuilder(
    column: $table.tipoparam,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $TafparamglobalAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafparamglobal> {
  $TafparamglobalAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumnWithTypeConverter<String, String> get codparam =>
      $composableBuilder(column: $table.codparam, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get descparam =>
      $composableBuilder(column: $table.descparam, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get valparam =>
      $composableBuilder(column: $table.valparam, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get tipoparam =>
      $composableBuilder(column: $table.tipoparam, builder: (column) => column);
}

class $TafparamglobalTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Tafparamglobal,
          i1.ParamGlobal,
          i1.$TafparamglobalFilterComposer,
          i1.$TafparamglobalOrderingComposer,
          i1.$TafparamglobalAnnotationComposer,
          $TafparamglobalCreateCompanionBuilder,
          $TafparamglobalUpdateCompanionBuilder,
          (
            i1.ParamGlobal,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.Tafparamglobal,
              i1.ParamGlobal
            >,
          ),
          i1.ParamGlobal,
          i0.PrefetchHooks Function()
        > {
  $TafparamglobalTableManager(i0.GeneratedDatabase db, i1.Tafparamglobal table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$TafparamglobalFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$TafparamglobalOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$TafparamglobalAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> codparam = const i0.Value.absent(),
                i0.Value<String> descparam = const i0.Value.absent(),
                i0.Value<String> valparam = const i0.Value.absent(),
                i0.Value<String> tipoparam = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafparamglobalCompanion(
                codparam: codparam,
                descparam: descparam,
                valparam: valparam,
                tipoparam: tipoparam,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codparam,
                required String descparam,
                required String valparam,
                required String tipoparam,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafparamglobalCompanion.insert(
                codparam: codparam,
                descparam: descparam,
                valparam: valparam,
                tipoparam: tipoparam,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $TafparamglobalProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Tafparamglobal,
      i1.ParamGlobal,
      i1.$TafparamglobalFilterComposer,
      i1.$TafparamglobalOrderingComposer,
      i1.$TafparamglobalAnnotationComposer,
      $TafparamglobalCreateCompanionBuilder,
      $TafparamglobalUpdateCompanionBuilder,
      (
        i1.ParamGlobal,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.Tafparamglobal,
          i1.ParamGlobal
        >,
      ),
      i1.ParamGlobal,
      i0.PrefetchHooks Function()
    >;
typedef $TafparamperfilCreateCompanionBuilder =
    i1.TafparamperfilCompanion Function({
      required String codparam,
      required String descparam,
      required String valparam,
      required String tipoparam,
      required String codperfil,
      i0.Value<int> rowid,
    });
typedef $TafparamperfilUpdateCompanionBuilder =
    i1.TafparamperfilCompanion Function({
      i0.Value<String> codparam,
      i0.Value<String> descparam,
      i0.Value<String> valparam,
      i0.Value<String> tipoparam,
      i0.Value<String> codperfil,
      i0.Value<int> rowid,
    });

class $TafparamperfilFilterComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafparamperfil> {
  $TafparamperfilFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnWithTypeConverterFilters<String, String, String> get codparam =>
      $composableBuilder(
        column: $table.codparam,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get descparam =>
      $composableBuilder(
        column: $table.descparam,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get valparam =>
      $composableBuilder(
        column: $table.valparam,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get tipoparam =>
      $composableBuilder(
        column: $table.tipoparam,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get codperfil =>
      $composableBuilder(
        column: $table.codperfil,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );
}

class $TafparamperfilOrderingComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafparamperfil> {
  $TafparamperfilOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get codparam => $composableBuilder(
    column: $table.codparam,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get descparam => $composableBuilder(
    column: $table.descparam,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get valparam => $composableBuilder(
    column: $table.valparam,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get tipoparam => $composableBuilder(
    column: $table.tipoparam,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get codperfil => $composableBuilder(
    column: $table.codperfil,
    builder: (column) => i0.ColumnOrderings(column),
  );
}

class $TafparamperfilAnnotationComposer
    extends i0.Composer<i0.GeneratedDatabase, i1.Tafparamperfil> {
  $TafparamperfilAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumnWithTypeConverter<String, String> get codparam =>
      $composableBuilder(column: $table.codparam, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get descparam =>
      $composableBuilder(column: $table.descparam, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get valparam =>
      $composableBuilder(column: $table.valparam, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get tipoparam =>
      $composableBuilder(column: $table.tipoparam, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get codperfil =>
      $composableBuilder(column: $table.codperfil, builder: (column) => column);
}

class $TafparamperfilTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.Tafparamperfil,
          i1.ParamPerfil,
          i1.$TafparamperfilFilterComposer,
          i1.$TafparamperfilOrderingComposer,
          i1.$TafparamperfilAnnotationComposer,
          $TafparamperfilCreateCompanionBuilder,
          $TafparamperfilUpdateCompanionBuilder,
          (
            i1.ParamPerfil,
            i0.BaseReferences<
              i0.GeneratedDatabase,
              i1.Tafparamperfil,
              i1.ParamPerfil
            >,
          ),
          i1.ParamPerfil,
          i0.PrefetchHooks Function()
        > {
  $TafparamperfilTableManager(i0.GeneratedDatabase db, i1.Tafparamperfil table)
    : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$TafparamperfilFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              i1.$TafparamperfilOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              i1.$TafparamperfilAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                i0.Value<String> codparam = const i0.Value.absent(),
                i0.Value<String> descparam = const i0.Value.absent(),
                i0.Value<String> valparam = const i0.Value.absent(),
                i0.Value<String> tipoparam = const i0.Value.absent(),
                i0.Value<String> codperfil = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafparamperfilCompanion(
                codparam: codparam,
                descparam: descparam,
                valparam: valparam,
                tipoparam: tipoparam,
                codperfil: codperfil,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codparam,
                required String descparam,
                required String valparam,
                required String tipoparam,
                required String codperfil,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafparamperfilCompanion.insert(
                codparam: codparam,
                descparam: descparam,
                valparam: valparam,
                tipoparam: tipoparam,
                codperfil: codperfil,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $TafparamperfilProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.Tafparamperfil,
      i1.ParamPerfil,
      i1.$TafparamperfilFilterComposer,
      i1.$TafparamperfilOrderingComposer,
      i1.$TafparamperfilAnnotationComposer,
      $TafparamperfilCreateCompanionBuilder,
      $TafparamperfilUpdateCompanionBuilder,
      (
        i1.ParamPerfil,
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.Tafparamperfil,
          i1.ParamPerfil
        >,
      ),
      i1.ParamPerfil,
      i0.PrefetchHooks Function()
    >;
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

  static i1.Tafunidade _codunidadeTable(i0.GeneratedDatabase db) =>
      i3.ReadDatabaseContainer(db)
          .resultSet<i1.Tafunidade>('tafunidade')
          .createAlias(
            i0.$_aliasNameGenerator(
              i3.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafusuario>('tafusuario').codunidade,
              i3.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafunidade>('tafunidade').codunidade,
            ),
          );

  i1.$TafunidadeProcessedTableManager get codunidade {
    final $_column = $_itemColumn<String>('codunidade')!;

    final manager = i1
        .$TafunidadeTableManager(
          $_db,
          i3.ReadDatabaseContainer($_db).resultSet<i1.Tafunidade>('tafunidade'),
        )
        .filter((f) => f.codunidade.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codunidadeTable($_db));
    if (item == null) return manager;
    return i0.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static i1.Tafperfil _codperfilTable(i0.GeneratedDatabase db) =>
      i3.ReadDatabaseContainer(db)
          .resultSet<i1.Tafperfil>('tafperfil')
          .createAlias(
            i0.$_aliasNameGenerator(
              i3.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafusuario>('tafusuario').codperfil,
              i3.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafperfil>('tafperfil').codperfil,
            ),
          );

  i1.$TafperfilProcessedTableManager get codperfil {
    final $_column = $_itemColumn<String>('codperfil')!;

    final manager = i1
        .$TafperfilTableManager(
          $_db,
          i3.ReadDatabaseContainer($_db).resultSet<i1.Tafperfil>('tafperfil'),
        )
        .filter((f) => f.codperfil.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codperfilTable($_db));
    if (item == null) return manager;
    return i0.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static i1.Tafequipe _codequipeTable(i0.GeneratedDatabase db) =>
      i3.ReadDatabaseContainer(db)
          .resultSet<i1.Tafequipe>('tafequipe')
          .createAlias(
            i0.$_aliasNameGenerator(
              i3.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafusuario>('tafusuario').codequipe,
              i3.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafequipe>('tafequipe').codequipe,
            ),
          );

  i1.$TafequipeProcessedTableManager get codequipe {
    final $_column = $_itemColumn<String>('codequipe')!;

    final manager = i1
        .$TafequipeTableManager(
          $_db,
          i3.ReadDatabaseContainer($_db).resultSet<i1.Tafequipe>('tafequipe'),
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

  i1.$TafunidadeFilterComposer get codunidade {
    final i1.$TafunidadeFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafunidade>('tafunidade'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafunidadeFilterComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafunidade>('tafunidade'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i1.$TafperfilFilterComposer get codperfil {
    final i1.$TafperfilFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codperfil,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafperfil>('tafperfil'),
      getReferencedColumn: (t) => t.codperfil,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafperfilFilterComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafperfil>('tafperfil'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i1.$TafequipeFilterComposer get codequipe {
    final i1.$TafequipeFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codequipe,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafequipe>('tafequipe'),
      getReferencedColumn: (t) => t.codequipe,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafequipeFilterComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafequipe>('tafequipe'),
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

  i1.$TafunidadeOrderingComposer get codunidade {
    final i1.$TafunidadeOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafunidade>('tafunidade'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafunidadeOrderingComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafunidade>('tafunidade'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i1.$TafperfilOrderingComposer get codperfil {
    final i1.$TafperfilOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codperfil,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafperfil>('tafperfil'),
      getReferencedColumn: (t) => t.codperfil,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafperfilOrderingComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafperfil>('tafperfil'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i1.$TafequipeOrderingComposer get codequipe {
    final i1.$TafequipeOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codequipe,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafequipe>('tafequipe'),
      getReferencedColumn: (t) => t.codequipe,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafequipeOrderingComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafequipe>('tafequipe'),
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

  i1.$TafunidadeAnnotationComposer get codunidade {
    final i1.$TafunidadeAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codunidade,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafunidade>('tafunidade'),
      getReferencedColumn: (t) => t.codunidade,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafunidadeAnnotationComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafunidade>('tafunidade'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i1.$TafperfilAnnotationComposer get codperfil {
    final i1.$TafperfilAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codperfil,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafperfil>('tafperfil'),
      getReferencedColumn: (t) => t.codperfil,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafperfilAnnotationComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafperfil>('tafperfil'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  i1.$TafequipeAnnotationComposer get codequipe {
    final i1.$TafequipeAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codequipe,
      referencedTable: i3.ReadDatabaseContainer(
        $db,
      ).resultSet<i1.Tafequipe>('tafequipe'),
      getReferencedColumn: (t) => t.codequipe,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i1.$TafequipeAnnotationComposer(
            $db: $db,
            $table: i3.ReadDatabaseContainer(
              $db,
            ).resultSet<i1.Tafequipe>('tafequipe'),
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

class Tafunidade extends i0.Table with i0.TableInfo<Tafunidade, i1.Unidade> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Tafunidade(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumnWithTypeConverter<String, String> codunidade =
      i0.GeneratedColumn<String>(
        'codunidade',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      ).withConverter<String>(i1.Tafunidade.$convertercodunidade);
  late final i0.GeneratedColumnWithTypeConverter<String, String> descunidade =
      i0.GeneratedColumn<String>(
        'descunidade',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafunidade.$converterdescunidade);
  @override
  List<i0.GeneratedColumn> get $columns => [codunidade, descunidade];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tafunidade';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {codunidade};
  @override
  i1.Unidade map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Unidade(
      codunidade: i1.Tafunidade.$convertercodunidade.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}codunidade'],
        )!,
      ),
      descunidade: i1.Tafunidade.$converterdescunidade.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}descunidade'],
        )!,
      ),
    );
  }

  @override
  Tafunidade createAlias(String alias) {
    return Tafunidade(attachedDatabase, alias);
  }

  static i0.TypeConverter<String, String> $convertercodunidade =
      const i2.Length(36);
  static i0.TypeConverter<String, String> $converterdescunidade =
      const i2.Length(36);
  @override
  bool get dontWriteConstraints => true;
}

class Unidade extends i0.DataClass implements i0.Insertable<i1.Unidade> {
  final String codunidade;
  final String descunidade;
  const Unidade({required this.codunidade, required this.descunidade});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    {
      map['codunidade'] = i0.Variable<String>(
        i1.Tafunidade.$convertercodunidade.toSql(codunidade),
      );
    }
    {
      map['descunidade'] = i0.Variable<String>(
        i1.Tafunidade.$converterdescunidade.toSql(descunidade),
      );
    }
    return map;
  }

  i1.TafunidadeCompanion toCompanion(bool nullToAbsent) {
    return i1.TafunidadeCompanion(
      codunidade: i0.Value(codunidade),
      descunidade: i0.Value(descunidade),
    );
  }

  factory Unidade.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Unidade(
      codunidade: serializer.fromJson<String>(json['codunidade']),
      descunidade: serializer.fromJson<String>(json['descunidade']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codunidade': serializer.toJson<String>(codunidade),
      'descunidade': serializer.toJson<String>(descunidade),
    };
  }

  i1.Unidade copyWith({String? codunidade, String? descunidade}) => i1.Unidade(
    codunidade: codunidade ?? this.codunidade,
    descunidade: descunidade ?? this.descunidade,
  );
  Unidade copyWithCompanion(i1.TafunidadeCompanion data) {
    return Unidade(
      codunidade: data.codunidade.present
          ? data.codunidade.value
          : this.codunidade,
      descunidade: data.descunidade.present
          ? data.descunidade.value
          : this.descunidade,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Unidade(')
          ..write('codunidade: $codunidade, ')
          ..write('descunidade: $descunidade')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codunidade, descunidade);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Unidade &&
          other.codunidade == this.codunidade &&
          other.descunidade == this.descunidade);
}

class TafunidadeCompanion extends i0.UpdateCompanion<i1.Unidade> {
  final i0.Value<String> codunidade;
  final i0.Value<String> descunidade;
  final i0.Value<int> rowid;
  const TafunidadeCompanion({
    this.codunidade = const i0.Value.absent(),
    this.descunidade = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  TafunidadeCompanion.insert({
    required String codunidade,
    required String descunidade,
    this.rowid = const i0.Value.absent(),
  }) : codunidade = i0.Value(codunidade),
       descunidade = i0.Value(descunidade);
  static i0.Insertable<i1.Unidade> custom({
    i0.Expression<String>? codunidade,
    i0.Expression<String>? descunidade,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (codunidade != null) 'codunidade': codunidade,
      if (descunidade != null) 'descunidade': descunidade,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.TafunidadeCompanion copyWith({
    i0.Value<String>? codunidade,
    i0.Value<String>? descunidade,
    i0.Value<int>? rowid,
  }) {
    return i1.TafunidadeCompanion(
      codunidade: codunidade ?? this.codunidade,
      descunidade: descunidade ?? this.descunidade,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (codunidade.present) {
      map['codunidade'] = i0.Variable<String>(
        i1.Tafunidade.$convertercodunidade.toSql(codunidade.value),
      );
    }
    if (descunidade.present) {
      map['descunidade'] = i0.Variable<String>(
        i1.Tafunidade.$converterdescunidade.toSql(descunidade.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TafunidadeCompanion(')
          ..write('codunidade: $codunidade, ')
          ..write('descunidade: $descunidade, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Tafperfil extends i0.Table with i0.TableInfo<Tafperfil, i1.Perfil> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Tafperfil(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumnWithTypeConverter<String, String> codperfil =
      i0.GeneratedColumn<String>(
        'codperfil',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      ).withConverter<String>(i1.Tafperfil.$convertercodperfil);
  late final i0.GeneratedColumnWithTypeConverter<String, String> descperfil =
      i0.GeneratedColumn<String>(
        'descperfil',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafperfil.$converterdescperfil);
  @override
  List<i0.GeneratedColumn> get $columns => [codperfil, descperfil];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tafperfil';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {codperfil};
  @override
  i1.Perfil map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Perfil(
      codperfil: i1.Tafperfil.$convertercodperfil.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}codperfil'],
        )!,
      ),
      descperfil: i1.Tafperfil.$converterdescperfil.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}descperfil'],
        )!,
      ),
    );
  }

  @override
  Tafperfil createAlias(String alias) {
    return Tafperfil(attachedDatabase, alias);
  }

  static i0.TypeConverter<String, String> $convertercodperfil = const i2.Length(
    36,
  );
  static i0.TypeConverter<String, String> $converterdescperfil =
      const i2.Length(50);
  @override
  bool get dontWriteConstraints => true;
}

class Perfil extends i0.DataClass implements i0.Insertable<i1.Perfil> {
  final String codperfil;
  final String descperfil;
  const Perfil({required this.codperfil, required this.descperfil});
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    {
      map['codperfil'] = i0.Variable<String>(
        i1.Tafperfil.$convertercodperfil.toSql(codperfil),
      );
    }
    {
      map['descperfil'] = i0.Variable<String>(
        i1.Tafperfil.$converterdescperfil.toSql(descperfil),
      );
    }
    return map;
  }

  i1.TafperfilCompanion toCompanion(bool nullToAbsent) {
    return i1.TafperfilCompanion(
      codperfil: i0.Value(codperfil),
      descperfil: i0.Value(descperfil),
    );
  }

  factory Perfil.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Perfil(
      codperfil: serializer.fromJson<String>(json['codperfil']),
      descperfil: serializer.fromJson<String>(json['descperfil']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codperfil': serializer.toJson<String>(codperfil),
      'descperfil': serializer.toJson<String>(descperfil),
    };
  }

  i1.Perfil copyWith({String? codperfil, String? descperfil}) => i1.Perfil(
    codperfil: codperfil ?? this.codperfil,
    descperfil: descperfil ?? this.descperfil,
  );
  Perfil copyWithCompanion(i1.TafperfilCompanion data) {
    return Perfil(
      codperfil: data.codperfil.present ? data.codperfil.value : this.codperfil,
      descperfil: data.descperfil.present
          ? data.descperfil.value
          : this.descperfil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Perfil(')
          ..write('codperfil: $codperfil, ')
          ..write('descperfil: $descperfil')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codperfil, descperfil);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Perfil &&
          other.codperfil == this.codperfil &&
          other.descperfil == this.descperfil);
}

class TafperfilCompanion extends i0.UpdateCompanion<i1.Perfil> {
  final i0.Value<String> codperfil;
  final i0.Value<String> descperfil;
  final i0.Value<int> rowid;
  const TafperfilCompanion({
    this.codperfil = const i0.Value.absent(),
    this.descperfil = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  TafperfilCompanion.insert({
    required String codperfil,
    required String descperfil,
    this.rowid = const i0.Value.absent(),
  }) : codperfil = i0.Value(codperfil),
       descperfil = i0.Value(descperfil);
  static i0.Insertable<i1.Perfil> custom({
    i0.Expression<String>? codperfil,
    i0.Expression<String>? descperfil,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (codperfil != null) 'codperfil': codperfil,
      if (descperfil != null) 'descperfil': descperfil,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.TafperfilCompanion copyWith({
    i0.Value<String>? codperfil,
    i0.Value<String>? descperfil,
    i0.Value<int>? rowid,
  }) {
    return i1.TafperfilCompanion(
      codperfil: codperfil ?? this.codperfil,
      descperfil: descperfil ?? this.descperfil,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (codperfil.present) {
      map['codperfil'] = i0.Variable<String>(
        i1.Tafperfil.$convertercodperfil.toSql(codperfil.value),
      );
    }
    if (descperfil.present) {
      map['descperfil'] = i0.Variable<String>(
        i1.Tafperfil.$converterdescperfil.toSql(descperfil.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TafperfilCompanion(')
          ..write('codperfil: $codperfil, ')
          ..write('descperfil: $descperfil, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Tafequipe extends i0.Table with i0.TableInfo<Tafequipe, i1.Equipe> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Tafequipe(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumnWithTypeConverter<String, String> codequipe =
      i0.GeneratedColumn<String>(
        'codequipe',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      ).withConverter<String>(i1.Tafequipe.$convertercodequipe);
  late final i0.GeneratedColumnWithTypeConverter<String, String> desequipe =
      i0.GeneratedColumn<String>(
        'desequipe',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafequipe.$converterdesequipe);
  late final i0.GeneratedColumnWithTypeConverter<String, String> codunidade =
      i0.GeneratedColumn<String>(
        'codunidade',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL REFERENCES tafunidade(codunidade)',
      ).withConverter<String>(i1.Tafequipe.$convertercodunidade);
  late final i0.GeneratedColumnWithTypeConverter<String, String> cdeqpai =
      i0.GeneratedColumn<String>(
        'cdeqpai',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL REFERENCES tafequipe(codequipe)',
      ).withConverter<String>(i1.Tafequipe.$convertercdeqpai);
  @override
  List<i0.GeneratedColumn> get $columns => [
    codequipe,
    desequipe,
    codunidade,
    cdeqpai,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tafequipe';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {codequipe};
  @override
  i1.Equipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.Equipe(
      codequipe: i1.Tafequipe.$convertercodequipe.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}codequipe'],
        )!,
      ),
      desequipe: i1.Tafequipe.$converterdesequipe.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}desequipe'],
        )!,
      ),
      codunidade: i1.Tafequipe.$convertercodunidade.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}codunidade'],
        )!,
      ),
      cdeqpai: i1.Tafequipe.$convertercdeqpai.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}cdeqpai'],
        )!,
      ),
    );
  }

  @override
  Tafequipe createAlias(String alias) {
    return Tafequipe(attachedDatabase, alias);
  }

  static i0.TypeConverter<String, String> $convertercodequipe = const i2.Length(
    36,
  );
  static i0.TypeConverter<String, String> $converterdesequipe = const i2.Length(
    50,
  );
  static i0.TypeConverter<String, String> $convertercodunidade =
      const i2.Length(36);
  static i0.TypeConverter<String, String> $convertercdeqpai = const i2.Length(
    36,
  );
  @override
  bool get dontWriteConstraints => true;
}

class Equipe extends i0.DataClass implements i0.Insertable<i1.Equipe> {
  final String codequipe;
  final String desequipe;
  final String codunidade;
  final String cdeqpai;
  const Equipe({
    required this.codequipe,
    required this.desequipe,
    required this.codunidade,
    required this.cdeqpai,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    {
      map['codequipe'] = i0.Variable<String>(
        i1.Tafequipe.$convertercodequipe.toSql(codequipe),
      );
    }
    {
      map['desequipe'] = i0.Variable<String>(
        i1.Tafequipe.$converterdesequipe.toSql(desequipe),
      );
    }
    {
      map['codunidade'] = i0.Variable<String>(
        i1.Tafequipe.$convertercodunidade.toSql(codunidade),
      );
    }
    {
      map['cdeqpai'] = i0.Variable<String>(
        i1.Tafequipe.$convertercdeqpai.toSql(cdeqpai),
      );
    }
    return map;
  }

  i1.TafequipeCompanion toCompanion(bool nullToAbsent) {
    return i1.TafequipeCompanion(
      codequipe: i0.Value(codequipe),
      desequipe: i0.Value(desequipe),
      codunidade: i0.Value(codunidade),
      cdeqpai: i0.Value(cdeqpai),
    );
  }

  factory Equipe.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return Equipe(
      codequipe: serializer.fromJson<String>(json['codequipe']),
      desequipe: serializer.fromJson<String>(json['desequipe']),
      codunidade: serializer.fromJson<String>(json['codunidade']),
      cdeqpai: serializer.fromJson<String>(json['cdeqpai']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codequipe': serializer.toJson<String>(codequipe),
      'desequipe': serializer.toJson<String>(desequipe),
      'codunidade': serializer.toJson<String>(codunidade),
      'cdeqpai': serializer.toJson<String>(cdeqpai),
    };
  }

  i1.Equipe copyWith({
    String? codequipe,
    String? desequipe,
    String? codunidade,
    String? cdeqpai,
  }) => i1.Equipe(
    codequipe: codequipe ?? this.codequipe,
    desequipe: desequipe ?? this.desequipe,
    codunidade: codunidade ?? this.codunidade,
    cdeqpai: cdeqpai ?? this.cdeqpai,
  );
  Equipe copyWithCompanion(i1.TafequipeCompanion data) {
    return Equipe(
      codequipe: data.codequipe.present ? data.codequipe.value : this.codequipe,
      desequipe: data.desequipe.present ? data.desequipe.value : this.desequipe,
      codunidade: data.codunidade.present
          ? data.codunidade.value
          : this.codunidade,
      cdeqpai: data.cdeqpai.present ? data.cdeqpai.value : this.cdeqpai,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Equipe(')
          ..write('codequipe: $codequipe, ')
          ..write('desequipe: $desequipe, ')
          ..write('codunidade: $codunidade, ')
          ..write('cdeqpai: $cdeqpai')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codequipe, desequipe, codunidade, cdeqpai);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Equipe &&
          other.codequipe == this.codequipe &&
          other.desequipe == this.desequipe &&
          other.codunidade == this.codunidade &&
          other.cdeqpai == this.cdeqpai);
}

class TafequipeCompanion extends i0.UpdateCompanion<i1.Equipe> {
  final i0.Value<String> codequipe;
  final i0.Value<String> desequipe;
  final i0.Value<String> codunidade;
  final i0.Value<String> cdeqpai;
  final i0.Value<int> rowid;
  const TafequipeCompanion({
    this.codequipe = const i0.Value.absent(),
    this.desequipe = const i0.Value.absent(),
    this.codunidade = const i0.Value.absent(),
    this.cdeqpai = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  TafequipeCompanion.insert({
    required String codequipe,
    required String desequipe,
    required String codunidade,
    required String cdeqpai,
    this.rowid = const i0.Value.absent(),
  }) : codequipe = i0.Value(codequipe),
       desequipe = i0.Value(desequipe),
       codunidade = i0.Value(codunidade),
       cdeqpai = i0.Value(cdeqpai);
  static i0.Insertable<i1.Equipe> custom({
    i0.Expression<String>? codequipe,
    i0.Expression<String>? desequipe,
    i0.Expression<String>? codunidade,
    i0.Expression<String>? cdeqpai,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (codequipe != null) 'codequipe': codequipe,
      if (desequipe != null) 'desequipe': desequipe,
      if (codunidade != null) 'codunidade': codunidade,
      if (cdeqpai != null) 'cdeqpai': cdeqpai,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.TafequipeCompanion copyWith({
    i0.Value<String>? codequipe,
    i0.Value<String>? desequipe,
    i0.Value<String>? codunidade,
    i0.Value<String>? cdeqpai,
    i0.Value<int>? rowid,
  }) {
    return i1.TafequipeCompanion(
      codequipe: codequipe ?? this.codequipe,
      desequipe: desequipe ?? this.desequipe,
      codunidade: codunidade ?? this.codunidade,
      cdeqpai: cdeqpai ?? this.cdeqpai,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (codequipe.present) {
      map['codequipe'] = i0.Variable<String>(
        i1.Tafequipe.$convertercodequipe.toSql(codequipe.value),
      );
    }
    if (desequipe.present) {
      map['desequipe'] = i0.Variable<String>(
        i1.Tafequipe.$converterdesequipe.toSql(desequipe.value),
      );
    }
    if (codunidade.present) {
      map['codunidade'] = i0.Variable<String>(
        i1.Tafequipe.$convertercodunidade.toSql(codunidade.value),
      );
    }
    if (cdeqpai.present) {
      map['cdeqpai'] = i0.Variable<String>(
        i1.Tafequipe.$convertercdeqpai.toSql(cdeqpai.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TafequipeCompanion(')
          ..write('codequipe: $codequipe, ')
          ..write('desequipe: $desequipe, ')
          ..write('codunidade: $codunidade, ')
          ..write('cdeqpai: $cdeqpai, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Tafparamglobal extends i0.Table
    with i0.TableInfo<Tafparamglobal, i1.ParamGlobal> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Tafparamglobal(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumnWithTypeConverter<String, String> codparam =
      i0.GeneratedColumn<String>(
        'codparam',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      ).withConverter<String>(i1.Tafparamglobal.$convertercodparam);
  late final i0.GeneratedColumnWithTypeConverter<String, String> descparam =
      i0.GeneratedColumn<String>(
        'descparam',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafparamglobal.$converterdescparam);
  late final i0.GeneratedColumnWithTypeConverter<String, String> valparam =
      i0.GeneratedColumn<String>(
        'valparam',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafparamglobal.$convertervalparam);
  late final i0.GeneratedColumnWithTypeConverter<String, String> tipoparam =
      i0.GeneratedColumn<String>(
        'tipoparam',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafparamglobal.$convertertipoparam);
  @override
  List<i0.GeneratedColumn> get $columns => [
    codparam,
    descparam,
    valparam,
    tipoparam,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tafparamglobal';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {codparam};
  @override
  i1.ParamGlobal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.ParamGlobal(
      codparam: i1.Tafparamglobal.$convertercodparam.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}codparam'],
        )!,
      ),
      descparam: i1.Tafparamglobal.$converterdescparam.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}descparam'],
        )!,
      ),
      valparam: i1.Tafparamglobal.$convertervalparam.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}valparam'],
        )!,
      ),
      tipoparam: i1.Tafparamglobal.$convertertipoparam.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}tipoparam'],
        )!,
      ),
    );
  }

  @override
  Tafparamglobal createAlias(String alias) {
    return Tafparamglobal(attachedDatabase, alias);
  }

  static i0.TypeConverter<String, String> $convertercodparam = const i2.Length(
    36,
  );
  static i0.TypeConverter<String, String> $converterdescparam = const i2.Length(
    100,
  );
  static i0.TypeConverter<String, String> $convertervalparam = const i2.Length(
    200,
  );
  static i0.TypeConverter<String, String> $convertertipoparam = const i2.Length(
    20,
  );
  @override
  bool get dontWriteConstraints => true;
}

class ParamGlobal extends i0.DataClass
    implements i0.Insertable<i1.ParamGlobal> {
  final String codparam;
  final String descparam;
  final String valparam;
  final String tipoparam;
  const ParamGlobal({
    required this.codparam,
    required this.descparam,
    required this.valparam,
    required this.tipoparam,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    {
      map['codparam'] = i0.Variable<String>(
        i1.Tafparamglobal.$convertercodparam.toSql(codparam),
      );
    }
    {
      map['descparam'] = i0.Variable<String>(
        i1.Tafparamglobal.$converterdescparam.toSql(descparam),
      );
    }
    {
      map['valparam'] = i0.Variable<String>(
        i1.Tafparamglobal.$convertervalparam.toSql(valparam),
      );
    }
    {
      map['tipoparam'] = i0.Variable<String>(
        i1.Tafparamglobal.$convertertipoparam.toSql(tipoparam),
      );
    }
    return map;
  }

  i1.TafparamglobalCompanion toCompanion(bool nullToAbsent) {
    return i1.TafparamglobalCompanion(
      codparam: i0.Value(codparam),
      descparam: i0.Value(descparam),
      valparam: i0.Value(valparam),
      tipoparam: i0.Value(tipoparam),
    );
  }

  factory ParamGlobal.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ParamGlobal(
      codparam: serializer.fromJson<String>(json['codparam']),
      descparam: serializer.fromJson<String>(json['descparam']),
      valparam: serializer.fromJson<String>(json['valparam']),
      tipoparam: serializer.fromJson<String>(json['tipoparam']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codparam': serializer.toJson<String>(codparam),
      'descparam': serializer.toJson<String>(descparam),
      'valparam': serializer.toJson<String>(valparam),
      'tipoparam': serializer.toJson<String>(tipoparam),
    };
  }

  i1.ParamGlobal copyWith({
    String? codparam,
    String? descparam,
    String? valparam,
    String? tipoparam,
  }) => i1.ParamGlobal(
    codparam: codparam ?? this.codparam,
    descparam: descparam ?? this.descparam,
    valparam: valparam ?? this.valparam,
    tipoparam: tipoparam ?? this.tipoparam,
  );
  ParamGlobal copyWithCompanion(i1.TafparamglobalCompanion data) {
    return ParamGlobal(
      codparam: data.codparam.present ? data.codparam.value : this.codparam,
      descparam: data.descparam.present ? data.descparam.value : this.descparam,
      valparam: data.valparam.present ? data.valparam.value : this.valparam,
      tipoparam: data.tipoparam.present ? data.tipoparam.value : this.tipoparam,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParamGlobal(')
          ..write('codparam: $codparam, ')
          ..write('descparam: $descparam, ')
          ..write('valparam: $valparam, ')
          ..write('tipoparam: $tipoparam')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codparam, descparam, valparam, tipoparam);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.ParamGlobal &&
          other.codparam == this.codparam &&
          other.descparam == this.descparam &&
          other.valparam == this.valparam &&
          other.tipoparam == this.tipoparam);
}

class TafparamglobalCompanion extends i0.UpdateCompanion<i1.ParamGlobal> {
  final i0.Value<String> codparam;
  final i0.Value<String> descparam;
  final i0.Value<String> valparam;
  final i0.Value<String> tipoparam;
  final i0.Value<int> rowid;
  const TafparamglobalCompanion({
    this.codparam = const i0.Value.absent(),
    this.descparam = const i0.Value.absent(),
    this.valparam = const i0.Value.absent(),
    this.tipoparam = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  TafparamglobalCompanion.insert({
    required String codparam,
    required String descparam,
    required String valparam,
    required String tipoparam,
    this.rowid = const i0.Value.absent(),
  }) : codparam = i0.Value(codparam),
       descparam = i0.Value(descparam),
       valparam = i0.Value(valparam),
       tipoparam = i0.Value(tipoparam);
  static i0.Insertable<i1.ParamGlobal> custom({
    i0.Expression<String>? codparam,
    i0.Expression<String>? descparam,
    i0.Expression<String>? valparam,
    i0.Expression<String>? tipoparam,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (codparam != null) 'codparam': codparam,
      if (descparam != null) 'descparam': descparam,
      if (valparam != null) 'valparam': valparam,
      if (tipoparam != null) 'tipoparam': tipoparam,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.TafparamglobalCompanion copyWith({
    i0.Value<String>? codparam,
    i0.Value<String>? descparam,
    i0.Value<String>? valparam,
    i0.Value<String>? tipoparam,
    i0.Value<int>? rowid,
  }) {
    return i1.TafparamglobalCompanion(
      codparam: codparam ?? this.codparam,
      descparam: descparam ?? this.descparam,
      valparam: valparam ?? this.valparam,
      tipoparam: tipoparam ?? this.tipoparam,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (codparam.present) {
      map['codparam'] = i0.Variable<String>(
        i1.Tafparamglobal.$convertercodparam.toSql(codparam.value),
      );
    }
    if (descparam.present) {
      map['descparam'] = i0.Variable<String>(
        i1.Tafparamglobal.$converterdescparam.toSql(descparam.value),
      );
    }
    if (valparam.present) {
      map['valparam'] = i0.Variable<String>(
        i1.Tafparamglobal.$convertervalparam.toSql(valparam.value),
      );
    }
    if (tipoparam.present) {
      map['tipoparam'] = i0.Variable<String>(
        i1.Tafparamglobal.$convertertipoparam.toSql(tipoparam.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TafparamglobalCompanion(')
          ..write('codparam: $codparam, ')
          ..write('descparam: $descparam, ')
          ..write('valparam: $valparam, ')
          ..write('tipoparam: $tipoparam, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Tafparamperfil extends i0.Table
    with i0.TableInfo<Tafparamperfil, i1.ParamPerfil> {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  Tafparamperfil(this.attachedDatabase, [this._alias]);
  late final i0.GeneratedColumnWithTypeConverter<String, String> codparam =
      i0.GeneratedColumn<String>(
        'codparam',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL PRIMARY KEY',
      ).withConverter<String>(i1.Tafparamperfil.$convertercodparam);
  late final i0.GeneratedColumnWithTypeConverter<String, String> descparam =
      i0.GeneratedColumn<String>(
        'descparam',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafparamperfil.$converterdescparam);
  late final i0.GeneratedColumnWithTypeConverter<String, String> valparam =
      i0.GeneratedColumn<String>(
        'valparam',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafparamperfil.$convertervalparam);
  late final i0.GeneratedColumnWithTypeConverter<String, String> tipoparam =
      i0.GeneratedColumn<String>(
        'tipoparam',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafparamperfil.$convertertipoparam);
  late final i0.GeneratedColumnWithTypeConverter<String, String> codperfil =
      i0.GeneratedColumn<String>(
        'codperfil',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafparamperfil.$convertercodperfil);
  @override
  List<i0.GeneratedColumn> get $columns => [
    codparam,
    descparam,
    valparam,
    tipoparam,
    codperfil,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tafparamperfil';
  @override
  Set<i0.GeneratedColumn> get $primaryKey => {codparam};
  @override
  i1.ParamPerfil map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.ParamPerfil(
      codparam: i1.Tafparamperfil.$convertercodparam.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}codparam'],
        )!,
      ),
      descparam: i1.Tafparamperfil.$converterdescparam.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}descparam'],
        )!,
      ),
      valparam: i1.Tafparamperfil.$convertervalparam.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}valparam'],
        )!,
      ),
      tipoparam: i1.Tafparamperfil.$convertertipoparam.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}tipoparam'],
        )!,
      ),
      codperfil: i1.Tafparamperfil.$convertercodperfil.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}codperfil'],
        )!,
      ),
    );
  }

  @override
  Tafparamperfil createAlias(String alias) {
    return Tafparamperfil(attachedDatabase, alias);
  }

  static i0.TypeConverter<String, String> $convertercodparam = const i2.Length(
    36,
  );
  static i0.TypeConverter<String, String> $converterdescparam = const i2.Length(
    100,
  );
  static i0.TypeConverter<String, String> $convertervalparam = const i2.Length(
    200,
  );
  static i0.TypeConverter<String, String> $convertertipoparam = const i2.Length(
    20,
  );
  static i0.TypeConverter<String, String> $convertercodperfil = const i2.Length(
    36,
  );
  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(codperfil)REFERENCES tafperfil(codperfil)',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class ParamPerfil extends i0.DataClass
    implements i0.Insertable<i1.ParamPerfil> {
  final String codparam;
  final String descparam;
  final String valparam;
  final String tipoparam;
  final String codperfil;
  const ParamPerfil({
    required this.codparam,
    required this.descparam,
    required this.valparam,
    required this.tipoparam,
    required this.codperfil,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    {
      map['codparam'] = i0.Variable<String>(
        i1.Tafparamperfil.$convertercodparam.toSql(codparam),
      );
    }
    {
      map['descparam'] = i0.Variable<String>(
        i1.Tafparamperfil.$converterdescparam.toSql(descparam),
      );
    }
    {
      map['valparam'] = i0.Variable<String>(
        i1.Tafparamperfil.$convertervalparam.toSql(valparam),
      );
    }
    {
      map['tipoparam'] = i0.Variable<String>(
        i1.Tafparamperfil.$convertertipoparam.toSql(tipoparam),
      );
    }
    {
      map['codperfil'] = i0.Variable<String>(
        i1.Tafparamperfil.$convertercodperfil.toSql(codperfil),
      );
    }
    return map;
  }

  i1.TafparamperfilCompanion toCompanion(bool nullToAbsent) {
    return i1.TafparamperfilCompanion(
      codparam: i0.Value(codparam),
      descparam: i0.Value(descparam),
      valparam: i0.Value(valparam),
      tipoparam: i0.Value(tipoparam),
      codperfil: i0.Value(codperfil),
    );
  }

  factory ParamPerfil.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return ParamPerfil(
      codparam: serializer.fromJson<String>(json['codparam']),
      descparam: serializer.fromJson<String>(json['descparam']),
      valparam: serializer.fromJson<String>(json['valparam']),
      tipoparam: serializer.fromJson<String>(json['tipoparam']),
      codperfil: serializer.fromJson<String>(json['codperfil']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codparam': serializer.toJson<String>(codparam),
      'descparam': serializer.toJson<String>(descparam),
      'valparam': serializer.toJson<String>(valparam),
      'tipoparam': serializer.toJson<String>(tipoparam),
      'codperfil': serializer.toJson<String>(codperfil),
    };
  }

  i1.ParamPerfil copyWith({
    String? codparam,
    String? descparam,
    String? valparam,
    String? tipoparam,
    String? codperfil,
  }) => i1.ParamPerfil(
    codparam: codparam ?? this.codparam,
    descparam: descparam ?? this.descparam,
    valparam: valparam ?? this.valparam,
    tipoparam: tipoparam ?? this.tipoparam,
    codperfil: codperfil ?? this.codperfil,
  );
  ParamPerfil copyWithCompanion(i1.TafparamperfilCompanion data) {
    return ParamPerfil(
      codparam: data.codparam.present ? data.codparam.value : this.codparam,
      descparam: data.descparam.present ? data.descparam.value : this.descparam,
      valparam: data.valparam.present ? data.valparam.value : this.valparam,
      tipoparam: data.tipoparam.present ? data.tipoparam.value : this.tipoparam,
      codperfil: data.codperfil.present ? data.codperfil.value : this.codperfil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParamPerfil(')
          ..write('codparam: $codparam, ')
          ..write('descparam: $descparam, ')
          ..write('valparam: $valparam, ')
          ..write('tipoparam: $tipoparam, ')
          ..write('codperfil: $codperfil')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(codparam, descparam, valparam, tipoparam, codperfil);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.ParamPerfil &&
          other.codparam == this.codparam &&
          other.descparam == this.descparam &&
          other.valparam == this.valparam &&
          other.tipoparam == this.tipoparam &&
          other.codperfil == this.codperfil);
}

class TafparamperfilCompanion extends i0.UpdateCompanion<i1.ParamPerfil> {
  final i0.Value<String> codparam;
  final i0.Value<String> descparam;
  final i0.Value<String> valparam;
  final i0.Value<String> tipoparam;
  final i0.Value<String> codperfil;
  final i0.Value<int> rowid;
  const TafparamperfilCompanion({
    this.codparam = const i0.Value.absent(),
    this.descparam = const i0.Value.absent(),
    this.valparam = const i0.Value.absent(),
    this.tipoparam = const i0.Value.absent(),
    this.codperfil = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  TafparamperfilCompanion.insert({
    required String codparam,
    required String descparam,
    required String valparam,
    required String tipoparam,
    required String codperfil,
    this.rowid = const i0.Value.absent(),
  }) : codparam = i0.Value(codparam),
       descparam = i0.Value(descparam),
       valparam = i0.Value(valparam),
       tipoparam = i0.Value(tipoparam),
       codperfil = i0.Value(codperfil);
  static i0.Insertable<i1.ParamPerfil> custom({
    i0.Expression<String>? codparam,
    i0.Expression<String>? descparam,
    i0.Expression<String>? valparam,
    i0.Expression<String>? tipoparam,
    i0.Expression<String>? codperfil,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (codparam != null) 'codparam': codparam,
      if (descparam != null) 'descparam': descparam,
      if (valparam != null) 'valparam': valparam,
      if (tipoparam != null) 'tipoparam': tipoparam,
      if (codperfil != null) 'codperfil': codperfil,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.TafparamperfilCompanion copyWith({
    i0.Value<String>? codparam,
    i0.Value<String>? descparam,
    i0.Value<String>? valparam,
    i0.Value<String>? tipoparam,
    i0.Value<String>? codperfil,
    i0.Value<int>? rowid,
  }) {
    return i1.TafparamperfilCompanion(
      codparam: codparam ?? this.codparam,
      descparam: descparam ?? this.descparam,
      valparam: valparam ?? this.valparam,
      tipoparam: tipoparam ?? this.tipoparam,
      codperfil: codperfil ?? this.codperfil,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (codparam.present) {
      map['codparam'] = i0.Variable<String>(
        i1.Tafparamperfil.$convertercodparam.toSql(codparam.value),
      );
    }
    if (descparam.present) {
      map['descparam'] = i0.Variable<String>(
        i1.Tafparamperfil.$converterdescparam.toSql(descparam.value),
      );
    }
    if (valparam.present) {
      map['valparam'] = i0.Variable<String>(
        i1.Tafparamperfil.$convertervalparam.toSql(valparam.value),
      );
    }
    if (tipoparam.present) {
      map['tipoparam'] = i0.Variable<String>(
        i1.Tafparamperfil.$convertertipoparam.toSql(tipoparam.value),
      );
    }
    if (codperfil.present) {
      map['codperfil'] = i0.Variable<String>(
        i1.Tafparamperfil.$convertercodperfil.toSql(codperfil.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = i0.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TafparamperfilCompanion(')
          ..write('codparam: $codparam, ')
          ..write('descparam: $descparam, ')
          ..write('valparam: $valparam, ')
          ..write('tipoparam: $tipoparam, ')
          ..write('codperfil: $codperfil, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

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
      const i2.Length(36);
  static i0.TypeConverter<String, String> $convertercodunidade =
      const i2.Length(36);
  static i0.TypeConverter<String, String> $convertercodperfil = const i2.Length(
    36,
  );
  static i0.TypeConverter<String, String> $convertercodequipe = const i2.Length(
    36,
  );
  static i0.TypeConverter<String, String> $converterdescnome = const i2.Length(
    50,
  );
  static i0.TypeConverter<String, String> $converterdesclogin = const i2.Length(
    50,
  );
  static i0.TypeConverter<String, String> $converterdescsenha = const i2.Length(
    255,
  );
  static i0.TypeConverter<String, String> $converterdescemail = const i2.Length(
    100,
  );
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
