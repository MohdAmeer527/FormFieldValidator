import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class IMEIField extends BaseFormField {
  const IMEIField({
    Key? key,
    required TextEditingController controller,
    String label = 'IMEI Number',
    String hint = 'Enter 15-digit IMEI number',

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
        LengthLimitingTextInputFormatter(15),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (value.length != 15) {
            return 'IMEI must be 15 digits';
          }
          // Luhn algorithm check could be added here
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
   
     
    );
  }
}