import 'package:flutter/material.dart';


class NameField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onSaved;
  final String? label;
  final String? hint;
 

  const NameField({
    Key? key,
    required this.controller,
    required this.onSaved,
    this.label = 'Name *',
    this.hint = 'Enter your full name',
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:  InputDecoration(
        labelText: label,
        hintText: hint,
      ),
     
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}