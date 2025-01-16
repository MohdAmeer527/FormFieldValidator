import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class MMIDField extends BaseFormField {
  const MMIDField({
    Key? key,
    required TextEditingController controller,
    String label = 'MMID',
    String hint = 'Enter 7-digit MMID',
    
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
        LengthLimitingTextInputFormatter(7),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (value.length != 7) {
            return 'MMID must be 7 digits';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}