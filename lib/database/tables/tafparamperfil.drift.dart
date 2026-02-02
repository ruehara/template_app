// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:template_app/database/tables/tafparamperfil.drift.dart' as i1;
import 'package:template_app/database/helpers/converters.dart' as i2;

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
