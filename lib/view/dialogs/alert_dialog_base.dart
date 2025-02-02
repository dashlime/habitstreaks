import 'package:flutter/material.dart';

class AlertDialogBase extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;

  const AlertDialogBase({super.key, required this.title, required this.content, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(15),
      contentPadding: const EdgeInsets.all(15),
      actionsPadding: const EdgeInsets.all(15),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: Center(child: Text(title, style: Theme.of(context).textTheme.titleSmall)),
      content: content,
      actions: [
        Row(
          spacing: 15,
          children: [
            for (var action in actions)
              Expanded(child: action)
          ],
        )
      ]
    );
  }
}