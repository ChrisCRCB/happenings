import 'package:drift/drift.dart';

import 'mixins.dart';

/// The subjects table.
class NoteSubjects extends Table with IdMixin {
  /// The name of the subject.
  TextColumn get name => text()();
}
