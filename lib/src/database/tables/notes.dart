import 'package:drift/drift.dart';

import 'mixins.dart';
import 'note_subjects.dart';

/// A note about a subject.
class Notes extends Table with IdMixin {
  /// The ID of the subject which this note is about.
  IntColumn get subjectId =>
      integer().references(NoteSubjects, #id, onDelete: KeyAction.cascade)();

  /// The date this note was made.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// The text of the note.
  TextColumn get body => text()();
}
