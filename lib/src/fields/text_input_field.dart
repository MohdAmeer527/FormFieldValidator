import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../base_field.dart';


class TextInputField extends BaseFormField {
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;

  const TextInputField({
    Key? key,
    required TextEditingController controller,
    String? label,
    String? hint,
   
    super.validator,
    super.onSaved,
    super.isRequired,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
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
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      validator: defaultValidator,
      onSaved: onSaved,
      
    );
  }
}