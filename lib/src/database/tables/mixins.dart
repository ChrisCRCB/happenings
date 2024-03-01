import 'package:drift/drift.dart';

/// Add an [id] column.
mixin IdMixin on Table {
  /// The primary key column.
  IntColumn get id => integer().autoIncrement()();
}
