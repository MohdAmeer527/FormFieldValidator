import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class SwiftCodeField extends BaseFormField {
  const SwiftCodeField({
    Key? key,
    required TextEditingController controller,
    String label = 'SWIFT/BIC Code',
    String hint = 'Enter SWIFT code',
    
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
        LengthLimitingTextInputFormatter(11),
        FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$').hasMatch(value)) {
            return 'Invalid SWIFT/BIC code format';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}