import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class VPAField extends BaseFormField {
  const VPAField({
    Key? key,
    required TextEditingController controller,
    String label = 'Virtual Payment Address',
    String hint = 'username@bank',
    
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
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z]{3,}$').hasMatch(value)) {
            return 'Invalid VPA format';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}