import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class VINField extends BaseFormField {
  const VINField({
    Key? key,
    required TextEditingController controller,
    String label = 'Vehicle Identification Number',
    String hint = 'Enter 17-character VIN',
    
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
        LengthLimitingTextInputFormatter(17),
        FilteringTextInputFormatter.allow(RegExp(r'[A-HJ-NPR-Z0-9]')), // Excluding I, O, Q
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (value.length != 17) {
            return 'VIN must be 17 characters';
          }
          if (!RegExp(r'^[A-HJ-NPR-Z0-9]{17}$').hasMatch(value)) {
            return 'Invalid VIN format';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}