import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/base_field.dart';
import '../../core/validators.dart';

class PANField extends BaseFormField {
  const PANField({
    Key? key,
    required TextEditingController controller,
    String label = 'PAN Number',
    String hint = 'Enter PAN number',
    
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
      textCapitalization: TextCapitalization.characters,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9]')),
        LengthLimitingTextInputFormatter(10),
      ],
      validator: (value) => FormValidators.validatePAN(value),
      onSaved: onSaved,
      
      
    );
  }
}