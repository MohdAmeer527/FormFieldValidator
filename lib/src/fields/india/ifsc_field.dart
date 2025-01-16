import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class IFSCField extends BaseFormField {
  const IFSCField({
    Key? key,
    required TextEditingController controller,
    String label = 'IFSC Code',
    String hint = 'Enter 11-character IFSC code',
    
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
          if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(value)) {
            return 'Invalid IFSC code format';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}