import 'package:flutter/material.dart';

/// A button to create new things.
class NewButton extends StatelessWidget {
  /// Create an instance.
  const NewButton({
    required this.onPressed,
    required this.label,
    super.key,
  });

  /// The function to call when the button is pressed.
  final VoidCallback onPressed;

  /// The label text to use.
  final String label;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => FloatingActionButton(
        onPressed: onPressed,
        tooltip: label,
        child: const Icon(Icons.new_label_outlined),
      );
}
