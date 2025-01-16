import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/base_field.dart';
import '../../core/validators.dart';

class IFSCField extends BaseFormField {
  const IFSCField({
    Key? key,
    required TextEditingController controller,
    String label = 'IFSC Code',
    String hint = 'Enter IFSC code',
    
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
      textCapitalization: TextCapitalization.characters,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
        LengthLimitingTextInputFormatter(11),
      ],
      validator: (value) => FormValidators.validateIFSC(value),
      onSaved: onSaved,
      
      
    );
  }
}