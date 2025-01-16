import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrivingLicenseField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onSaved;
  final String? label;
  final String? hint;

  const DrivingLicenseField({
    Key? key,
    required this.controller,
    required this.onSaved,
    this.label = 'Driving License',
    this.hint = 'MH-01-2023-1234567',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        helperText: 'SS-RR-YYYY-NNNNNNN',
      ),
      textCapitalization: TextCapitalization.characters,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter driving license number';
        }

        final cleanValue = value.replaceAll(RegExp(r'[\s-]'), '');
        final pattern = RegExp(r'^[A-Z]{2}[0-9]{2}[0-9]{4}[0-9]{7}$');

        if (cleanValue.length != 15) {
          return 'Driving license must be 15 characters long';
        }

        if (!pattern.hasMatch(cleanValue)) {
          return 'Invalid driving license format';
        }

        return null;
      },
      onSaved: onSaved,
    );
  }
}