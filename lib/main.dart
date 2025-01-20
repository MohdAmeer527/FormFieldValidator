import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Global Fields
import 'package:common_form_fields_validator/src/fields/global/address_field.dart';
import 'package:common_form_fields_validator/src/fields/global/bank_account_field.dart';
import 'package:common_form_fields_validator/src/fields/global/credit_card_field.dart';
import 'package:common_form_fields_validator/src/fields/global/email_field.dart';
import 'package:common_form_fields_validator/src/fields/global/ifsc_field.dart';
import 'package:common_form_fields_validator/src/fields/global/name_field.dart';
import 'package:common_form_fields_validator/src/fields/identity/passport_field.dart';
import 'package:common_form_fields_validator/src/fields/global/phone_field.dart';
import 'package:common_form_fields_validator/src/fields/identity/ssn_field.dart';
import 'package:common_form_fields_validator/src/fields/global/upi_field.dart';
import 'package:common_form_fields_validator/src/fields/miscellaneous/vin_field.dart';

// Specific Fields
import 'package:common_form_fields_validator/src/fields/identity/aadhar_field.dart';
import 'package:common_form_fields_validator/src/fields/miscellaneous/driving_license_field.dart';
import 'package:common_form_fields_validator/src/fields/identity/gst_field.dart';
import 'package:common_form_fields_validator/src/fields/identity/pan_field.dart';
import 'package:common_form_fields_validator/src/fields/miscellaneous/imei_field.dart';
import 'package:common_form_fields_validator/src/form_screen.dart';

// App Configuration and Theming
import 'src/form_config.dart';
import 'src/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Default Field Validator',
      theme: CustomThemes.lightTheme, // Light theme settings
      darkTheme: CustomThemes.darkTheme, // Dark theme settings
      themeMode: ThemeMode.system,
      home: const ExampleFormScreen(),
    );
  }
}

class ExampleFormScreen extends StatefulWidget {
  const ExampleFormScreen({super.key});

  @override
  State<ExampleFormScreen> createState() => _ExampleFormScreenState();
}

class _ExampleFormScreenState extends State<ExampleFormScreen> {
  // Controllers for form fields
  final Map<String, TextEditingController> _controllers = {
    'address': TextEditingController(),
    'name': TextEditingController(),
    'email': TextEditingController(),
    'phone': TextEditingController(),
    'creditCard': TextEditingController(),
    'accountNumber': TextEditingController(),
    'ifsc': TextEditingController(),
    'upi': TextEditingController(),
    'pan': TextEditingController(),
    'gst': TextEditingController(),
    'aadhar': TextEditingController(),
    'passport': TextEditingController(),
    'ssn': TextEditingController(),
    'drivingLicense': TextEditingController(),
    'imei': TextEditingController(),
    'vin': TextEditingController(),
  };

  @override
  void dispose() {
    // Dispose all controllers
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleSubmit() {
    // Collect data from all controllers into a map
    final formData = _controllers.map((key, controller) => MapEntry(key, controller.text));

    print('Form submitted with data: $formData');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form submitted successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Default Field Validator'),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          config: const FormConfig(
            autovalidateMode: true,
            fieldSpacing: 20.0,
            padding: EdgeInsets.all(20.0),
          ),
          onSubmit: (_) => _handleSubmit(),
          submitButtonText: 'Submit Form',
          fields: [
            // Global Fields
            AddressField(controller: _controllers['address'], validate: true),
            NameField(controller: _controllers['name'], validate: true),
            EmailField(controller: _controllers['email'], validate: true),
            PhoneField(controller: _controllers['phone']),
            CreditCardField(controller: _controllers['creditCard'], validate: true),
            AccountNumberField(controller: _controllers['accountNumber'], validate: true),
            IFSCField(controller: _controllers['ifsc'], validate: true),
            UPIField(controller: _controllers['upi'], validate: true),

            // Identity Fields
            PANNumberField(controller: _controllers['pan'], validate: true),
            GSTNumberField(controller: _controllers['gst'], validate: true),
            AadharField(controller: _controllers['aadhar'], validate: true),
            PassportField(controller: _controllers['passport'], validate: true),
            SSNField(controller: _controllers['ssn'], validate: true),

            // Miscellaneous Fields
            DrivingLicenseField(controller: _controllers['drivingLicense'], validate: true),
            IMEIField(controller: _controllers['imei'], validate: true),
            VINField(controller: _controllers['vin'], validate: true),
          ],
        ),
      ),
    );
  }
}
