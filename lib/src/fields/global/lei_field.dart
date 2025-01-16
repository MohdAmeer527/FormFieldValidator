import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class LEIField extends BaseFormField {
  const LEIField({
    Key? key,
    required TextEditingController controller,
    String label = 'Legal Entity Identifier',
    String hint = 'Enter 20-character LEI',
    
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
        LengthLimitingTextInputFormatter(20),
        FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (value.length != 20) {
            return 'LEI must be 20 characters';
          }
          if (!RegExp(r'^[A-Z0-9]{20}$').hasMatch(value)) {
            return 'Invalid LEI format';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}