import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class PassportField extends BaseFormField {
  const PassportField({
    Key? key,
    required TextEditingController controller,
    String label = 'Passport Number',
    String hint = 'Enter passport number',
    
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
        LengthLimitingTextInputFormatter(9),
        FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^[A-Z0-9]{8,9}$').hasMatch(value)) {
            return 'Please enter a valid passport number';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}