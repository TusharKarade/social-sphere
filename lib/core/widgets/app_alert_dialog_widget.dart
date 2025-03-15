import 'package:flutter/material.dart';

class AppAlertDialogWidget extends StatelessWidget {
  final String? title;
  final String content;
  final List<Widget> actions;

  const AppAlertDialogWidget({
    super.key,
    this.title,
    required this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: Text(content),
      actions: actions,
    );
  }
}
