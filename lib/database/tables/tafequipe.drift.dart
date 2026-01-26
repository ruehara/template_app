// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:template_app/database/tables/tafequipe.drift.dart' as i1;
import 'package:template_app/database/helpers/converters.dart' as i2;
import 'package:template_app/database/tables/tafunidade.drift.dart' as i3;
import 'package:drift/internal/modular.dart' as i4;

typedef $TafequipeCreateCompanionBuilder =
    i1.TafequipeCompanion Function({
      required String codequipe,
      required String descnome,
      required String codunidade,
      required String cdeqpai,
      i0.Value<int> rowid,
    });
typedef $TafequipeUpdateCompanionBuilder =
    i1.TafequipeCompanion Function({
      i0.Value<String> codequipe,
      i0.Value<String> descnome,
      i0.Value<String> codunidade,
      i0.Value<String> cdeqpai,
      i0.Value<int> rowid,
    });

final class $TafequipeReferences
    extends i0.BaseReferences<i0.GeneratedDatabase, i1.Tafequipe, i1.Equipe> {
  $TafequipeReferences(super.$_db, super.$_table, super.$_typedResult);

  static i3.Tafunidade _codunidadeTable(i0.GeneratedDatabase db) =>
      i4.ReadDatabaseContainer(db)
          .resultSet<i3.Tafunidade>('tafunidade')
          .createAlias(
            i0.$_aliasNameGenerator(
              i4.ReadDatabaseContainer(
                db,
              ).resultSet<i1.Tafequipe>('tafequipe').codunidade,
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

  i0.ColumnWithTypeConverterFilters<String, String, String> get descnome =>
      $composableBuilder(
        column: $table.descnome,
        builder: (column) => i0.ColumnWithTypeConverterFilters(column),
      );

  i0.ColumnWithTypeConverterFilters<String, String, String> get cdeqpai =>
      $composableBuilder(
        column: $table.cdeqpai,
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

  i0.ColumnOrderings<String> get descnome => $composableBuilder(
    column: $table.descnome,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get cdeqpai => $composableBuilder(
    column: $table.cdeqpai,
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

  i0.GeneratedColumnWithTypeConverter<String, String> get descnome =>
      $composableBuilder(column: $table.descnome, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<String, String> get cdeqpai =>
      $composableBuilder(column: $table.cdeqpai, builder: (column) => column);

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
          i0.PrefetchHooks Function({bool codunidade})
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
                i0.Value<String> descnome = const i0.Value.absent(),
                i0.Value<String> codunidade = const i0.Value.absent(),
                i0.Value<String> cdeqpai = const i0.Value.absent(),
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafequipeCompanion(
                codequipe: codequipe,
                descnome: descnome,
                codunidade: codunidade,
                cdeqpai: cdeqpai,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codequipe,
                required String descnome,
                required String codunidade,
                required String cdeqpai,
                i0.Value<int> rowid = const i0.Value.absent(),
              }) => i1.TafequipeCompanion.insert(
                codequipe: codequipe,
                descnome: descnome,
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
          prefetchHooksCallback: ({codunidade = false}) {
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
                return [];
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
      i0.PrefetchHooks Function({bool codunidade})
    >;

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
  late final i0.GeneratedColumnWithTypeConverter<String, String> descnome =
      i0.GeneratedColumn<String>(
        'descnome',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      ).withConverter<String>(i1.Tafequipe.$converterdescnome);
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
    descnome,
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
      descnome: i1.Tafequipe.$converterdescnome.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}descnome'],
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

  static i0.TypeConverter<String, String> $convertercodequipe =
      const i2.TextConverter(36);
  static i0.TypeConverter<String, String> $converterdescnome =
      const i2.TextConverter(50);
  static i0.TypeConverter<String, String> $convertercodunidade =
      const i2.TextConverter(36);
  static i0.TypeConverter<String, String> $convertercdeqpai =
      const i2.TextConverter(36);
  @override
  bool get dontWriteConstraints => true;
}

class Equipe extends i0.DataClass implements i0.Insertable<i1.Equipe> {
  final String codequipe;
  final String descnome;
  final String codunidade;
  final String cdeqpai;
  const Equipe({
    required this.codequipe,
    required this.descnome,
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
      map['descnome'] = i0.Variable<String>(
        i1.Tafequipe.$converterdescnome.toSql(descnome),
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
      descnome: i0.Value(descnome),
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
      descnome: serializer.fromJson<String>(json['descnome']),
      codunidade: serializer.fromJson<String>(json['codunidade']),
      cdeqpai: serializer.fromJson<String>(json['cdeqpai']),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codequipe': serializer.toJson<String>(codequipe),
      'descnome': serializer.toJson<String>(descnome),
      'codunidade': serializer.toJson<String>(codunidade),
      'cdeqpai': serializer.toJson<String>(cdeqpai),
    };
  }

  i1.Equipe copyWith({
    String? codequipe,
    String? descnome,
    String? codunidade,
    String? cdeqpai,
  }) => i1.Equipe(
    codequipe: codequipe ?? this.codequipe,
    descnome: descnome ?? this.descnome,
    codunidade: codunidade ?? this.codunidade,
    cdeqpai: cdeqpai ?? this.cdeqpai,
  );
  Equipe copyWithCompanion(i1.TafequipeCompanion data) {
    return Equipe(
      codequipe: data.codequipe.present ? data.codequipe.value : this.codequipe,
      descnome: data.descnome.present ? data.descnome.value : this.descnome,
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
          ..write('descnome: $descnome, ')
          ..write('codunidade: $codunidade, ')
          ..write('cdeqpai: $cdeqpai')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codequipe, descnome, codunidade, cdeqpai);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.Equipe &&
          other.codequipe == this.codequipe &&
          other.descnome == this.descnome &&
          other.codunidade == this.codunidade &&
          other.cdeqpai == this.cdeqpai);
}

class TafequipeCompanion extends i0.UpdateCompanion<i1.Equipe> {
  final i0.Value<String> codequipe;
  final i0.Value<String> descnome;
  final i0.Value<String> codunidade;
  final i0.Value<String> cdeqpai;
  final i0.Value<int> rowid;
  const TafequipeCompanion({
    this.codequipe = const i0.Value.absent(),
    this.descnome = const i0.Value.absent(),
    this.codunidade = const i0.Value.absent(),
    this.cdeqpai = const i0.Value.absent(),
    this.rowid = const i0.Value.absent(),
  });
  TafequipeCompanion.insert({
    required String codequipe,
    required String descnome,
    required String codunidade,
    required String cdeqpai,
    this.rowid = const i0.Value.absent(),
  }) : codequipe = i0.Value(codequipe),
       descnome = i0.Value(descnome),
       codunidade = i0.Value(codunidade),
       cdeqpai = i0.Value(cdeqpai);
  static i0.Insertable<i1.Equipe> custom({
    i0.Expression<String>? codequipe,
    i0.Expression<String>? descnome,
    i0.Expression<String>? codunidade,
    i0.Expression<String>? cdeqpai,
    i0.Expression<int>? rowid,
  }) {
    return i0.RawValuesInsertable({
      if (codequipe != null) 'codequipe': codequipe,
      if (descnome != null) 'descnome': descnome,
      if (codunidade != null) 'codunidade': codunidade,
      if (cdeqpai != null) 'cdeqpai': cdeqpai,
      if (rowid != null) 'rowid': rowid,
    });
  }

  i1.TafequipeCompanion copyWith({
    i0.Value<String>? codequipe,
    i0.Value<String>? descnome,
    i0.Value<String>? codunidade,
    i0.Value<String>? cdeqpai,
    i0.Value<int>? rowid,
  }) {
    return i1.TafequipeCompanion(
      codequipe: codequipe ?? this.codequipe,
      descnome: descnome ?? this.descnome,
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
    if (descnome.present) {
      map['descnome'] = i0.Variable<String>(
        i1.Tafequipe.$converterdescnome.toSql(descnome.value),
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
          ..write('descnome: $descnome, ')
          ..write('codunidade: $codunidade, ')
          ..write('cdeqpai: $cdeqpai, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}
