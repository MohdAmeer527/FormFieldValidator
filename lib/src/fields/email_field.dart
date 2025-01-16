import 'package:flutter/material.dart';


class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onSaved;
  final String? label;
  final String? hint;


  const EmailField({
    Key? key,
    required this.controller,
    required this.onSaved,
    this.label = 'Email *',
    this.hint = 'Enter your email',
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
     
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}