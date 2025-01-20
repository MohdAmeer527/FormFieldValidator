import 'package:common_form_fields_validator/flutter_form_sdk.dart';
import 'package:flutter/material.dart';

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


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
        title: const Text('Form SDK Example'),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
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
                ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                          _handleSubmit();
                      }
                    
                    },
                    child: const Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
