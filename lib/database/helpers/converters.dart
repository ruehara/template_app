import 'package:decimal/decimal.dart';
import 'package:drift/drift.dart';

class Length extends TypeConverter<String, String> {
  final int size;
  const Length(this.size);
  @override
  String fromSql(String fromDb) {
    return fromDb.length > size ? fromDb.substring(0, size) : fromDb;
  }

  @override
  String toSql(String value) {
    return value.length > size ? value.substring(0, size) : value;
  }
}

class DecimalConverter extends TypeConverter<Decimal, String> {
  final int scale;
  final int precision;
  const DecimalConverter(this.scale, this.precision);
  @override
  Decimal fromSql(String fromDb) {
    return Decimal.parse(fromDb);
  }

  @override
  String toSql(Decimal value) {
    return value.toString();
  }
}
