import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../base_field.dart';


class DOIField extends BaseFormField {
  const DOIField({
    Key? key,
    required TextEditingController controller,
    String label = 'Digital Object Identifier',
    String hint = '10.XXXX/XXXXX',
  
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
      keyboardType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9./]')),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^10\.[0-9]{4,}/[-._;()/:\w]+$').hasMatch(value)) {
            return 'Invalid DOI format';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}