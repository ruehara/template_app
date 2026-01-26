// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:template_app/database/tables/tafunidade.drift.dart' as i1;
import 'package:template_app/database/helpers/converters.dart' as i2;

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
          (
            i1.Unidade,
            i0.BaseReferences<i0.GeneratedDatabase, i1.Tafunidade, i1.Unidade>,
          ),
          i1.Unidade,
          i0.PrefetchHooks Function()
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
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (
        i1.Unidade,
        i0.BaseReferences<i0.GeneratedDatabase, i1.Tafunidade, i1.Unidade>,
      ),
      i1.Unidade,
      i0.PrefetchHooks Function()
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
      const i2.TextConverter(36);
  static i0.TypeConverter<String, String> $converterdescunidade =
      const i2.TextConverter(36);
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
