import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class UPIField extends BaseFormField {
  const UPIField({
    Key? key,
    required TextEditingController controller,
    String label = 'UPI ID',
    String hint = 'username@upi',
    
    super.onSaved,
    super.isRequired = true,
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
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]')),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter UPI ID';
        }
        if (!RegExp(r'^[a-zA-Z0-9.\-_]{2,49}@[a-zA-Z]{3,}$').hasMatch(value)) {
          return 'Invalid UPI ID format';
        }
        return null;
      },
      onSaved: onSaved,
      
      
    );
  }
}