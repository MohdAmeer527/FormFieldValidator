import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AadharField extends StatelessWidget {
  final TextEditingController controller;
  final bool isRequired;
  final Function(String?) onSaved;
  final String? label;
  final String? hint;

  const AadharField({
    Key? key,
    required this.controller,
    required this.onSaved,
    this.isRequired = false,
    this.label = 'Aadhar Number',
    this.hint = 'Enter 12-digit Aadhar number',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(12),
      ],
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'Aadhar number is required';
        }
        if (value != null && value.isNotEmpty && value.length != 12) {
          return 'Aadhar number must be 12 digits';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}