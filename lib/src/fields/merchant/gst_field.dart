import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/base_field.dart';
import '../../core/validators.dart';

class GSTField extends BaseFormField {
  const GSTField({
    Key? key,
    required TextEditingController controller,
    String label = 'GST Number',
    String hint = 'Enter GST number',
    
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
        FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Z]')),
        LengthLimitingTextInputFormatter(15),
      ],
      validator: (value) => FormValidators.validateGST(value),
      onSaved: onSaved,
      
      
    );
  }
}