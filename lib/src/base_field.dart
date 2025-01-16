import 'package:flutter/material.dart';



abstract class BaseFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
 
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool isRequired;

  const BaseFormField({
    Key? key,
    required this.controller,
    this.label,
    this.hint,
  
    this.validator,
    this.onSaved,
    this.isRequired = false,
  }) : super(key: key);

  String? defaultValidator(String? value) {
    if (isRequired && (value == null || value.isEmpty)) {
      return 'This field is required';
    }
    return validator?.call(value);
  }

  InputDecoration get defaultDecoration =>  InputDecoration(
    labelText: label,
    hintText: hint,
  );
}