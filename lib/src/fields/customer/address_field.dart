import 'package:flutter/material.dart';
import '../../core/base_field.dart';

class AddressField extends BaseFormField {
  final int maxLines;

  const AddressField({
    Key? key,
    required TextEditingController controller,
    String label = 'Address',
    String hint = 'Enter your full address',
    this.maxLines = 3,
    
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
      maxLines: maxLines,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your address';
        }
        if (value.trim().length < 10) {
          return 'Please enter a complete address';
        }
        return null;
      },
      onSaved: onSaved,
      
      
    );
  }
}