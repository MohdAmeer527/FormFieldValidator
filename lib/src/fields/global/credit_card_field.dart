import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class CreditCardField extends BaseFormField {
  const CreditCardField({
    Key? key,
    required TextEditingController controller,
    String label = 'Credit Card Number',
    String hint = 'XXXX XXXX XXXX XXXX',
    
    super.onSaved,
    super.isRequired = false,
  }) : super(
    key: key,
    controller: controller,
    label: label,
    hint: hint,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: defaultDecoration,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
        _CreditCardFormatter(),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          final cleanValue = value.replaceAll(RegExp(r'\s'), '');
          if (cleanValue.length < 13 || cleanValue.length > 19) {
            return 'Invalid credit card number length';
          }
          if (!_luhnCheck(cleanValue)) {
            return 'Invalid credit card number';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }

  bool _luhnCheck(String number) {
    int sum = 0;
    bool alternate = false;
    
    for (int i = number.length - 1; i >= 0; i--) {
      int n = int.parse(number[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) {
          n = (n % 10) + 1;
        }
      }
      sum += n;
      alternate = !alternate;
    }
    
    return sum % 10 == 0;
  }
}

class _CreditCardFormatter extends TextInputFormatter {
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