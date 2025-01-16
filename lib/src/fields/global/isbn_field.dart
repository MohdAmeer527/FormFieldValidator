import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class ISBNField extends BaseFormField {
  final bool isISBN13;

  const ISBNField({
    Key? key,
    required TextEditingController controller,
    this.isISBN13 = true,
    String? label,
    String? hint,
    
    super.onSaved,
    super.isRequired = false,
  }) : super(
    key: key,
    controller: controller,
    label: label ?? (isISBN13 ? 'ISBN-13' : 'ISBN-10'),
    hint: hint ?? 'Enter ISBN number',
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: defaultDecoration,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9X-]')),
        LengthLimitingTextInputFormatter(isISBN13 ? 17 : 13), // Including hyphens
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          final cleanValue = value.replaceAll('-', '');
          if (isISBN13) {
            if (!RegExp(r'^97[89][0-9]{10}$').hasMatch(cleanValue)) {
              return 'Invalid ISBN-13 format';
            }
          } else {
            if (!RegExp(r'^[0-9]{9}[0-9X]$').hasMatch(cleanValue)) {
              return 'Invalid ISBN-10 format';
            }
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}