import 'package:flutter/material.dart';
import '../../base_field.dart';

class BusinessNameField extends BaseFormField {
  const BusinessNameField({
    Key? key,
    required TextEditingController controller,
    String label = 'Business Name',
    String hint = 'Enter your business name',
    
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
          return 'Please enter your business name';
        }
        if (value.length < 3) {
          return 'Business name must be at least 3 characters';
        }
        return null;
      },
      onSaved: onSaved,
      
      
    );
  }
}