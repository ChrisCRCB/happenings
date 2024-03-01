import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/notes.dart';

part 'notes_dao.g.dart';

/// The notes DAO.
@DriftAccessor(tables: [Notes])
class NotesDao extends DatabaseAccessor<HappeningsDatabase>
    with _$NotesDaoMixin {
  /// Create an instance.
  NotesDao(super.db);

  /// Create a note about [noteSubject].
  Future<Note> createNote({
    required final NoteSubject noteSubject,
    required final String body,
  }) =>
      into(notes).insertReturning(
        NotesCompanion(
          subjectId: Value(noteSubject.id),
          body: Value(body),
        ),
      );

  /// Update [note].
  Future<Note> editNote({
    required final Note note,
    required final NotesCompanion companion,
  }) async {
    final query = update(notes)
      ..where((final table) => table.id.equals(note.id));
    final rows = await query.writeReturning(companion);
    return rows.single;
  }

  /// Delete [note].
  Future<int> deleteNote(final Note note) =>
      (delete(notes)..where((final table) => table.id.equals(note.id))).go();

  /// Get a single row by [id].
  Future<Note> getNote(final int id) =>
      (select(notes)..where((final table) => table.id.equals(id))).getSingle();

  /// Returns all notes on [subject], ordered by date descending.
  ///
  /// If [subject] is `null`, then all notes will be returned.
  Future<List<Note>> getNotes(final NoteSubject? subject) {
    final query = select(notes)
      ..orderBy([(final table) => OrderingTerm.desc(notes.createdAt)]);
    if (subject != null) {
      query.where((final table) => table.subjectId.equals(subject.id));
    }
    return query.get();
  }
}
