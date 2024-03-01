import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../database/database.dart';

part 'providers.g.dart';

/// Provide the database.
@riverpod
HappeningsDatabase database(final DatabaseRef ref) => HappeningsDatabase(
      File(
        path.join(
          const String.fromEnvironment('onedrive'),
          'Service Development',
          'happenings.sqlite3',
        ),
      ),
    );

/// Return all subjects.
@riverpod
Future<List<NoteSubject>> noteSubjects(final NoteSubjectsRef ref) {
  final database = ref.watch(databaseProvider);
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
  final database = ref.watch(databaseProvider);
  final subject = subjectId == null
      ? null
      : await database.noteSubjectsDao.getSubject(subjectId);
  final notes = await database.notesDao.getNotes(subject);
  return (subject, notes);
}
