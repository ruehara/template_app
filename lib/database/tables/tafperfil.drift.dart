// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:template_app/database/tables/tafperfil.drift.dart' as i1;
import 'package:template_app/database/helpers/converters.dart' as i2;

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
          (
            i1.Perfil,
            i0.BaseReferences<i0.GeneratedDatabase, i1.Tafperfil, i1.Perfil>,
          ),
          i1.Perfil,
          i0.PrefetchHooks Function()
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
              .map((e) => (e.readTable(table), i0.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (
        i1.Perfil,
        i0.BaseReferences<i0.GeneratedDatabase, i1.Tafperfil, i1.Perfil>,
      ),
      i1.Perfil,
      i0.PrefetchHooks Function()
    >;

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

  static i0.TypeConverter<String, String> $convertercodperfil =
      const i2.TextConverter(36);
  static i0.TypeConverter<String, String> $converterdescperfil =
      const i2.TextConverter(50);
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
