import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../base_field.dart';


class IBANField extends BaseFormField {
  const IBANField({
    Key? key,
    required TextEditingController controller,
    String label = 'IBAN',
    String hint = 'Enter IBAN number',
    
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
        LengthLimitingTextInputFormatter(34),
        FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^[A-Z]{2}[0-9]{2}[A-Z0-9]{1,30}$').hasMatch(value.replaceAll(' ', ''))) {
            return 'Please enter a valid IBAN';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}