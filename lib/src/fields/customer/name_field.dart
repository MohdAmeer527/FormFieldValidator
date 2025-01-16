import 'package:flutter/material.dart';

import '../../base_field.dart';


class NameField extends BaseFormField {
  const NameField({
    Key? key,
    required TextEditingController controller,
    String label = 'Full Name',
    String hint = 'Enter your full name',
  
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
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        if (value.trim().split(' ').length < 2) {
          return 'Please enter your full name';
        }
        return null;
      },
      onSaved: onSaved,
      
      
    );
  }
}