import 'package:flutter/material.dart';
import 'package:habitstreaks/controllers/input_checks.dart';
import 'package:intl/intl.dart';

class UpdateRepsDialogState extends State<UpdateRepsDialog> {
  late final TextEditingController repsController;
  bool isValid = true;

  void check() {
    setState(() {
      isValid = InputChecks.checkRepsNumberText(repsController.text) != null;
    });
  }

  @override
  void initState() {
    super.initState();

    repsController = TextEditingController(text: widget.initialValue.toString());

    repsController.addListener(() {
      check();
    });
  }

  @override
  void dispose() {
    repsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(DateFormat("dd-MM-yyyy").format(widget.date)),
      content: Column(
        mainAxisSize: MainAxisSize.min, // To make it wrap content only
        children: [
          TextField(
            controller: repsController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Reps number',
              hintText: 'Enter the new reps number',
              errorText: !isValid ? 'Enter a valid number' : null
            ),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            check();

            var number = InputChecks.checkRepsNumberText(repsController.text);

            if (isValid == true && number != null) {
              widget.onValueUpdated(number);
              Navigator.of(context).pop();
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}

class UpdateRepsDialog extends StatefulWidget {
  final ValueChanged<int> onValueUpdated;
  final int initialValue;
  final DateTime date;

  const UpdateRepsDialog({super.key, required this.date, required this.onValueUpdated, this.initialValue = 0});

  @override
  State<UpdateRepsDialog> createState() => UpdateRepsDialogState();
}