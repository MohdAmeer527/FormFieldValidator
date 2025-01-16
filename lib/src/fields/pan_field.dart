import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PanField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onSaved;
  final String? label;
  final String? hint;

  const PanField({
    Key? key,
    required this.controller,
    required this.onSaved,
    this.label = 'PAN Number',
    this.hint = 'Enter PAN number',
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
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9]')),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(value)) {
            return 'Please enter a valid PAN number';
          }
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}