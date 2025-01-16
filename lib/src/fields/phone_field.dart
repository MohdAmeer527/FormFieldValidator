import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onSaved;
  final String? label;
  final String? hint;

  const PhoneField({
    Key? key,
    required this.controller,
    required this.onSaved,
    this.label = 'Phone Number *',
    this.hint = 'Enter your phone number',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        if (value.length != 10) {
          return 'Phone number must be 10 digits';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}