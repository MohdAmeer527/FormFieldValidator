import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_picker/country_picker.dart';
import '../../core/base_field.dart';
import '../../core/validators.dart';
import '../../core/formatters.dart';

class PhoneField extends BaseFormField {
  final TextEditingController? countryCodeController;
  final String? initialCountryCode;
  final void Function(Country)? onCountryChanged;

  const PhoneField({
    Key? key,
    required TextEditingController controller,
    this.countryCodeController,
    this.initialCountryCode = 'IN',
    this.onCountryChanged,
    String label = 'Phone Number',
    String hint = 'Enter your phone number',
    
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
    final _countryCodeController = countryCodeController ?? TextEditingController(text: '+91');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Country code field
        SizedBox(
          width: 120,
          child: TextFormField(
            controller: _countryCodeController,
            decoration: defaultDecoration.copyWith(
              labelText: 'Code',
              prefixIcon: Icon(Icons.flag),
            ),
            readOnly: true,
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                favorite: ['IN', 'US', 'GB', 'CA', 'AU'],
                countryListTheme: CountryListThemeData(
                  borderRadius: BorderRadius.circular(8),
                  inputDecoration: defaultDecoration.copyWith(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                onSelect: (Country country) {
                  _countryCodeController.text = '+${country.phoneCode}';
                  onCountryChanged?.call(country);
                },
              );
            },
          ),
        ),
        SizedBox(width: 12),
        // Phone number field
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: defaultDecoration,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              PhoneNumberFormatter(),
            ],
            validator: (value) => FormValidators.validatePhone(value),
            onSaved: (value) {
              if (value != null && value.isNotEmpty) {
                onSaved?.call('${_countryCodeController.text}$value');
              } else {
                onSaved?.call(null);
              }
            },
            
            
          ),
        ),
      ],
    );
  }
}