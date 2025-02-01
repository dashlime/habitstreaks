import 'package:flutter/material.dart';
import 'package:habitstreaks/controllers/add_habit_dialog_controller.dart';
import 'package:habitstreaks/main.dart';
import 'package:habitstreaks/view/utilities/duration_input_formatter.dart';
import 'package:habitstreaks/view/widgets/buttons.dart';

class AddHabitDialogState extends State<AddHabitDialog> {
  final controller = AddHabitDialogController();

  @override
  void initState() {
    super.initState();

    controller.nameController.addListener(() {
      setState(() {
        controller.update();
      });
    });

    controller.durationController.addListener(() {
      setState(() {
        controller.update();
      });
    });

    controller.repsController.addListener(() {
      setState(() {
        controller.update();
      });
    });
  }

  @override
  void dispose() {
    controller.nameController.dispose();
    controller.durationController.dispose();
    controller.repsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add habit'),
      content: Column(
        mainAxisSize: MainAxisSize.min, // To make it wrap content only
        children: [
          TextField(
            controller: controller.nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your habit\'s name',
              errorText: !controller.isNameValid ? 'Enter a valid name' : null
            ),
          ),
          SizedBox(height: 20), // Spacer between TextField and Radio buttons
          
          Text("Goal type : "),
          ListTile(
            title: Text('Yes / No'),
            leading: Radio<int>(
              value: 1,
              groupValue: controller.selectedRadio,
              onChanged: (int? value) {
                setState(() {
                  controller.updateSelectedRadio(value!);
                });
              },
            ),
          ),
          ListTile(
            title: Text('Duration'),
            leading: Radio<int>(
              value: 2,
              groupValue: controller.selectedRadio,
              onChanged: (int? value) {
                setState(() {
                  controller.updateSelectedRadio(value!);
                });
              },
            ),
          ),
          if (controller.selectedRadio == 2)
            TextField(
              controller: controller.durationController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                DurationInputFormatter()
              ],
              decoration: InputDecoration(
                labelText: 'Duration',
                hintText: 'Enter your goal\'s duration',
                errorText: !controller.isDurationValid ? 'Enter a valid duration' : null
              ),
            ),
          ListTile(
            title: Text('Number of reps'),
            leading: Radio<int>(
              value: 3,
              groupValue: controller.selectedRadio,
              onChanged: (int? value) {
                setState(() {
                  controller.updateSelectedRadio(value!);
                });
              },
            ),
          ),
          if (controller.selectedRadio == 3)
            TextField(
              controller: controller.repsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Reps number',
                hintText: 'Enter your goal\'s reps number',
                errorText: !controller.isRepsValid ? 'Enter a valid number' : null
              ),
            ),
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
            var result = controller.saveToDatabase(database);

            if (result == true) {
              Navigator.of(context).pop();
            }
          },
          text: 'Submit',
        ),
      ],
    );
  }
}

class AddHabitDialog extends StatefulWidget {
  const AddHabitDialog({super.key});

  @override
  State<AddHabitDialog> createState() => AddHabitDialogState();
}