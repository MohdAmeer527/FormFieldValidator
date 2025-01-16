import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GSTField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onSaved;
  final String? label;
  final String? hint;

  const GSTField({
    Key? key,
    required this.controller,
    required this.onSaved,
    this.label = 'GST Number',
    this.hint = 'Enter GST number',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      textCapitalization: TextCapitalization.characters,
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$').hasMatch(value)) {
            return 'Please enter a valid GST number';
          }
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}