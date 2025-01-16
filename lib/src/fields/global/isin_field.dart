import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class ISINField extends BaseFormField {
  const ISINField({
    Key? key,
    required TextEditingController controller,
    String label = 'ISIN',
    String hint = 'Enter 12-character ISIN',
    
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
      textCapitalization: TextCapitalization.characters,
      inputFormatters: [
        LengthLimitingTextInputFormatter(12),
        FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^[A-Z]{2}[A-Z0-9]{9}[0-9]$').hasMatch(value)) {
            return 'Invalid ISIN format';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}