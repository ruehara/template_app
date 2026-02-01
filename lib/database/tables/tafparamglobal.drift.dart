// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:template_app/database/tables/tafparamglobal.drift.dart' as i1;
import 'package:template_app/database/helpers/converters.dart' as i2;

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
