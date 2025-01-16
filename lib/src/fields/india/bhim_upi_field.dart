import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../base_field.dart';

class BHIMUPIField extends BaseFormField {
  const BHIMUPIField({
    Key? key,
    required TextEditingController controller,
    String label = 'BHIM UPI ID',
    String hint = 'mobilenumber@upi',
    
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
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z@.]')),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^[0-9]{10}@upi$').hasMatch(value)) {
            return 'Invalid BHIM UPI ID format (should be 10-digit mobile number followed by @upi)';
          }
        }
        return defaultValidator(value);
      },
      onSaved: onSaved,
      
      
    );
  }
}