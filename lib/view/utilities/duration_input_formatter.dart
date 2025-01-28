import 'package:flutter/services.dart';

class DurationInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-digit characters
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Limit to 4 digits
    if (newText.length > 4) {
      newText = newText.substring(newText.length - 4);
    }

    // If the length is 3, add a colon after the second digit
    if (newText.length > 2) {
      newText = "${newText.substring(0, 2)}:${newText.substring(2, newText.length)}";
    }

    // Return the updated text value with formatted string
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}