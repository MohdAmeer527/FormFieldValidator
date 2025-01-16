import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/base_field.dart';

class BankAccountField extends BaseFormField {
  const BankAccountField({
    Key? key,
    required TextEditingController controller,
    String label = 'Bank Account Number',
    String hint = 'Enter bank account number',
    
    super.onSaved,
    super.isRequired = true,
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
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(18),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter bank account number';
        }
        if (value.length < 9 || value.length > 18) {
          return 'Invalid bank account number length';
        }
        return null;
      },
      onSaved: onSaved,
      
      
    );
  }
}