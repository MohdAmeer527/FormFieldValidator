import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class SSNField extends BaseFormField {
  const SSNField({
    Key? key,
    required TextEditingController controller,
    String label = 'Social Security Number',
    String hint = 'XXX-XX-XXXX',
    
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
        LengthLimitingTextInputFormatter(9),
        _SSNFormatter(),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          final cleanValue = value.replaceAll(RegExp(r'[^\d]'), '');
          if (cleanValue.length != 9) {
            return 'SSN must be 9 digits';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}

class _SSNFormatter extends TextInputFormatter {
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