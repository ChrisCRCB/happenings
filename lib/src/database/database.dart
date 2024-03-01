import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'daos/note_subjects_dao.dart';
import 'daos/notes_dao.dart';
import 'tables/note_subjects.dart';
import 'tables/notes.dart';

part 'database.g.dart';

/// The database to use.
@DriftDatabase(
  daos: [
    NoteSubjectsDao,
    NotesDao,
  ],
  tables: [
    NoteSubjects,
    Notes,
  ],
)
class HappeningsDatabase extends _$HappeningsDatabase {
  /// Create an instance.
  HappeningsDatabase(final File file) : super(NativeDatabase(file));

  /// The schema version.
  @override
  int get schemaVersion => 1;
}
