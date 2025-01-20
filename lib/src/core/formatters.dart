import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(' ', '');
    var newText = '';
    var selectionIndex = newValue.selection.end;

    for (var i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        newText += ' ';
        if (newValue.selection.end >= i) {
          selectionIndex++;
        }
      }
      newText += text[i];
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (text.length > 10) {
      return oldValue;
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

class CreditCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'\s'), '');
    var newText = '';
    var selectionIndex = newValue.selection.end;

    for (var i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        newText += ' ';
        if (newValue.selection.end >= i) {
          selectionIndex++;
        }
      }
      newText += text[i];
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class SSNFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    var newText = '';
    var selectionIndex = newValue.selection.end;

    for (var i = 0; i < text.length; i++) {
      if (i == 3 || i == 5) {
        newText += '-';
        if (newValue.selection.end >= i) {
          selectionIndex++;
        }
      }
      newText += text[i];
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}



class EmailInputFormatter extends TextInputFormatter {
  // Regular expression for valid email characters
  final RegExp _emailRegex = RegExp(r'[a-zA-Z0-9@._+-]');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Filter out any character that doesn't match the regex
    final String filteredText = newValue.text
        .split('')
        .where((char) => _emailRegex.hasMatch(char))
        .join();

    // If the filtered text is the same as the new value, return the new value
    // Otherwise, return the filtered text
    if (newValue.text == filteredText) {
      return newValue;
    }

    return TextEditingValue(
      text: filteredText,
      selection: TextSelection.collapsed(offset: filteredText.length),
    );
  }
}


class NameInputFormatter extends TextInputFormatter {
  // Regular expression to allow alphabets, spaces, hyphens, and apostrophes
  final RegExp _nameRegex = RegExp(r"[a-zA-Z\s'-]");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Filter out any character that doesn't match the regex
    final String filteredText = newValue.text
        .split('')
        .where((char) => _nameRegex.hasMatch(char))
        .join();

    // If the filtered text is the same as the new value, return the new value
    // Otherwise, return the filtered text
    if (newValue.text == filteredText) {
      return newValue;
    }

    return TextEditingValue(
      text: filteredText,
      selection: TextSelection.collapsed(offset: filteredText.length),
    );
  }
}


class DOIInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Only allow numbers, periods, and slashes
    return newValue.copyWith(
      text: newValue.text.replaceAll(RegExp(r'[^0-9./]'), ''),
      selection: TextSelection.collapsed(offset: newValue.text.length),
    );
  }
}


class GSTInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Remove any non-alphanumeric characters and convert to uppercase
    newText = newText.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toUpperCase();

    // Apply the GST format
    if (newText.length > 15) {
      newText = newText.substring(0, 15);
    }

    // Inserting the GST format pattern
    if (newText.length > 2) newText = '${newText.substring(0, 2)}${newText.substring(2)}';
    if (newText.length > 7) newText = '${newText.substring(0, 7)}${newText.substring(7)}';
    if (newText.length > 12) newText = '${newText.substring(0, 12)}${newText.substring(12)}';

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
class DrivingLicenseInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Remove any non-alphanumeric characters
    newText = newText.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toUpperCase();

    // Format as 'SS-YY-YYYY-NNNNNNN'
    if (newText.length > 2) newText = '${newText.substring(0, 2)}-${newText.substring(2)}';
    if (newText.length > 5) newText = '${newText.substring(0, 5)}-${newText.substring(5)}';
    if (newText.length > 9) newText = '${newText.substring(0, 9)}-${newText.substring(9)}';

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
