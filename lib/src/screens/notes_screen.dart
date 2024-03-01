import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/util.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/database.dart';
import '../providers/providers.dart';
import '../widgets/new_button.dart';

/// The notes tab.
class NotesScreen extends ConsumerWidget {
  /// Create an instance.
  const NotesScreen({
    required this.subjectId,
    super.key,
  });

  /// The ID of the subject to use.
  final int? subjectId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(subjectNotesProvider(subjectId));
    return Cancel(
      child: value.when(
        data: (final value) {
          final (noteSubject, notes) = value;
          final Widget child;
          if (notes.isEmpty) {
            child = const CenterText(
              text: 'There are no notes to show.',
              autofocus: true,
            );
          } else {
            child = ListView.builder(
              itemBuilder: (final context, final index) {
                final note = notes[index];
                return ListTile(
                  autofocus: index == 0,
                  title: Text(note.createdAt.toIso8601String()),
                  subtitle: Text(note.body),
                  onTap: () => setClipboardText(note.body),
                );
              },
              itemCount: notes.length,
            );
          }
          return SimpleScaffold(
            title: noteSubject?.name ?? 'All Notes',
            body: CommonShortcuts(
              newCallback: () => newNote(
                context: context,
                ref: ref,
                noteSubject: noteSubject,
              ),
              child: child,
            ),
            floatingActionButton: NewButton(
              onPressed: () => newNote(
                context: context,
                ref: ref,
                noteSubject: noteSubject,
              ),
              label: 'New Note',
            ),
          );
        },
        error: ErrorScreen.withPositional,
        loading: LoadingScreen.new,
      ),
    );
  }

  /// Create a new note.
  Future<void> newNote({
    required final BuildContext context,
    required final WidgetRef ref,
    required final NoteSubject? noteSubject,
  }) {
    if (noteSubject == null) {
      return showMessage(
        context: context,
        message: 'You must first select a subject.',
      );
    }
    return pushWidget(
      context: context,
      builder: (final builderContext) => GetText(
        onDone: (final text) async {
          Navigator.pop(context);
          final database = ref.read(databaseProvider);
          await database.notesDao.createNote(
            noteSubject: noteSubject,
            body: text,
          );
          ref.invalidate(subjectNotesProvider(noteSubject.id));
        },
      ),
    );
  }
}
