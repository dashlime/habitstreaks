import 'package:flutter/material.dart';
import 'package:habitstreaks/controllers/input_checks.dart';
import 'package:habitstreaks/view/utilities/converters.dart';
import 'package:habitstreaks/view/utilities/duration_input_formatter.dart';
import 'package:habitstreaks/view/widgets/buttons.dart';
import 'package:intl/intl.dart';

class UpdateDurationDialogState extends State<UpdateDurationDialog> {
  late final TextEditingController durationController;
  bool isValid = true;

  void check() {
    setState(() {
      isValid = InputChecks.checkDurationText(durationController.text) != null;
    });
  }

  @override
  void initState() {
    super.initState();

    durationController = TextEditingController(text: Converters.durationToText(widget.initialValue));

    durationController.addListener(() {
      check();
    });
  }

  @override
  void dispose() {
    durationController.dispose();
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
            controller: durationController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              DurationInputFormatter()
            ],
            decoration: InputDecoration(
              labelText: 'Duration',
              hintText: 'Enter the new duration',
              errorText: !isValid ? 'Enter a valid duration' : null
            ),
          )
        ],
      ),
      actions: [
        GradientOutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: 'Cancel',
        ),
        GradientFilledButton(
          onPressed: () {
            check();

            var number = InputChecks.checkDurationText(durationController.text);

            if (isValid == true && number != null) {
              widget.onValueUpdated(number);
              Navigator.of(context).pop();
            }
          },
          text: 'Submit',
        ),
      ],
    );
  }
}

class UpdateDurationDialog extends StatefulWidget {
  final ValueChanged<int> onValueUpdated;
  final int initialValue;
  final DateTime date;

  const UpdateDurationDialog({super.key, required this.onValueUpdated, required this.date, this.initialValue = 0});

  @override
  State<UpdateDurationDialog> createState() => UpdateDurationDialogState();
}