import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../database/database.dart';

part 'providers.g.dart';

/// Provide the database.
@riverpod
Future<HappeningsDatabase> database(final DatabaseRef ref) async {
  final directory =
      path.join((await getApplicationDocumentsDirectory()).path, 'happenings');
  return HappeningsDatabase(
    File(
      path.join(
        directory,
        'happenings.sqlite3',
      ),
    ),
  );
}

/// Return all subjects.
@riverpod
Future<List<NoteSubject>> noteSubjects(final NoteSubjectsRef ref) async {
  final database = await ref.watch(databaseProvider.future);
  return database.noteSubjectsDao.getSubjects();
}

/// Provide a list of notes.
///
/// If [subjectId] is `null`, then all notes will be returned.
@riverpod
Future<(NoteSubject?, List<Note>)> subjectNotes(
  final SubjectNotesRef ref,
  final int? subjectId,
) async {
  final database = await ref.watch(databaseProvider.future);
  final subject = subjectId == null
      ? null
      : await database.noteSubjectsDao.getSubject(subjectId);
  final notes = await database.notesDao.getNotes(subject);
  return (subject, notes);
}
