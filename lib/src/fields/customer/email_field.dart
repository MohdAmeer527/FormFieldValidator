import 'package:flutter/material.dart';
import '../../core/base_field.dart';
import '../../core/validators.dart';

class EmailField extends BaseFormField {
  const EmailField({
    Key? key,
    required TextEditingController controller,
    String label = 'Email',
    String hint = 'Enter your email address',
    
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
      validator: (value) => FormValidators.validateEmail(value),
      onSaved: onSaved,
      
      
    );
  }
}