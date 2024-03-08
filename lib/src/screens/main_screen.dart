import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/util.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../widgets/new_button.dart';
import 'tabs/note_subjects_tab.dart';

/// The main screen for the application.
class MainScreen extends ConsumerWidget {
  /// Create an instance.
  const MainScreen({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) =>
      CommonShortcuts(
        newCallback: () => newNoteSubject(context, ref),
        child: SimpleScaffold(
          title: 'Subjects',
          body: const NoteSubjectsTab(),
          floatingActionButton: NewButton(
            onPressed: () => newNoteSubject(context, ref),
            label: 'New Subject',
          ),
        ),
      );

  /// Create a new subject.
  void newNoteSubject(final BuildContext context, final WidgetRef ref) =>
      pushWidget(
        context: context,
        builder: (final getTextContext) => GetText(
          onDone: (final name) async {
            Navigator.pop(getTextContext);
            final database = await ref.read(databaseProvider.future);
            await database.noteSubjectsDao.createNoteSubject(name);
            ref.invalidate(noteSubjectsProvider);
          },
          labelText: 'Name',
          title: 'New Subject',
        ),
      );
}
