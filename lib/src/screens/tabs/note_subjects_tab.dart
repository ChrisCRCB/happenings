import 'package:backstreets_widgets/util.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../notes_screen.dart';

const _uncategorised = 'Uncategorised';

/// The subjects tab.
class NoteSubjectsTab extends ConsumerWidget {
  /// Create an instance.
  const NoteSubjectsTab({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(noteSubjectsProvider);
    return value.when(
      data: (final noteSubjects) {
        final allNoteSubjects = [null, ...noteSubjects];
        return BuiltSearchableListView(
          items: allNoteSubjects,
          builder: (final context, final index) {
            final subject = allNoteSubjects[index];
            final noteSubjectName = subject?.name ?? _uncategorised;
            return SearchableListTile(
              searchString: noteSubjectName,
              child: ListTile(
                autofocus: index == 0,
                title: Text(noteSubjectName),
                onTap: () => pushWidget(
                  context: context,
                  builder: (final _) => NotesScreen(subjectId: subject?.id),
                ),
              ),
            );
          },
        );
      },
      error: ErrorListView.withPositional,
      loading: LoadingWidget.new,
    );
  }
}
