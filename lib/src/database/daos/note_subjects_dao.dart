import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/note_subjects.dart';

part 'note_subjects_dao.g.dart';

/// The subjects DAO.
@DriftAccessor(tables: [NoteSubjects])
class NoteSubjectsDao extends DatabaseAccessor<HappeningsDatabase>
    with _$NoteSubjectsDaoMixin {
  /// Create an instance.
  NoteSubjectsDao(super.db);

  /// Create a companion with the given [name].
  Future<NoteSubject> createNoteSubject(final String name) => into(noteSubjects)
      .insertReturning(NoteSubjectsCompanion(name: Value(name)));

  /// Update [subject].
  Future<NoteSubject> editSubject({
    required final NoteSubject subject,
    required final NoteSubjectsCompanion companion,
  }) async {
    final query = update(noteSubjects)
      ..where((final table) => table.id.equals(subject.id));
    final rows = await query.writeReturning(companion);
    return rows.single;
  }

  /// Delete [subject].
  Future<int> deleteSubject(final NoteSubject subject) => (delete(noteSubjects)
        ..where((final table) => table.id.equals(subject.id)))
      .go();

  /// Get a single row by [id].
  Future<NoteSubject> getSubject(final int id) =>
      (select(noteSubjects)..where((final table) => table.id.equals(id)))
          .getSingle();

  /// Return all subjects ordered by name.
  Future<List<NoteSubject>> getSubjects() {
    final query = select(noteSubjects)
      ..orderBy([(final table) => OrderingTerm.asc(table.name)]);
    return query.get();
  }
}
