import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class BankAccountField extends BaseFormField {
  const BankAccountField({
    Key? key,
    required TextEditingController controller,
    String label = 'Bank Account Number',
    String hint = 'Enter bank account number',
    
    super.onSaved,
    super.isRequired = false,
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
        if (value != null && value.isNotEmpty) {
          if (value.length < 9 || value.length > 18) {
            return 'Bank account number must be between 9 and 18 digits';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}