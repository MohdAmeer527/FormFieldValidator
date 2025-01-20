# Common Form Fields Validator

A Flutter package to validate common form fields such as email, phone number, passwords, address, payments, identity documents, and more with customizable rules.

## Features

- Validate various form fields, including:
  - Personal Information
    - Email addresses
    - Phone numbers
    - Names
    - Physical addresses
  - Payment Information
    - Credit card numbers
    - Bank account numbers
    - IFSC codes
    - UPI IDs
  - Identity Documents
    - PAN card numbers
    - GST numbers
    - Aadhar numbers
    - Passport numbers
    - Social Security Numbers (SSN)
  - Other Documents
    - Driving license numbers
    - IMEI numbers
    - Vehicle Identification Numbers (VIN)
- Pre-built form fields with validation
- Customizable validation rules
- Easy integration with Flutter forms
- Auto-validation support
- Form state management

## Installation

Add the package to your pubspec.yaml file:

```yaml
dependencies:
  common_form_fields_validator: ^0.0.1
```

Then, run:

```bash
flutter pub get
```

## Usage

Here's an example of how to use the package:

```dart
import 'package:common_form_fields_validator/flutter_form_sdk.dart';
import 'package:flutter/material.dart';

class ExampleForm extends StatefulWidget {
  @override
  State<ExampleForm> createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Personal Information
          EmailField(
            controller: _emailController,
            validate: true,
          ),
          PhoneField(
            controller: _phoneController,
            validate: true,
          ),
          
          // Payment Information
          CreditCardField(
            controller: _creditCardController,
            validate: true,
          ),
          
          // Identity Documents
          PANNumberField(
            controller: _panController,
            validate: true,
          ),
          
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Process form
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
```

## Available Form Fields

### Personal Information
- `NameField`: Validates names
- `EmailField`: Validates email addresses
- `PhoneField`: Validates phone numbers
- `AddressField`: Validates physical addresses

### Payment Information
- `CreditCardField`: Validates credit card numbers
- `AccountNumberField`: Validates bank account numbers
- `IFSCField`: Validates IFSC codes
- `UPIField`: Validates UPI IDs

### Identity Documents
- `PANNumberField`: Validates PAN card numbers
- `GSTNumberField`: Validates GST numbers
- `AadharField`: Validates Aadhar numbers
- `PassportField`: Validates passport numbers
- `SSNField`: Validates Social Security Numbers

### Other Documents
- `DrivingLicenseField`: Validates driving license numbers
- `IMEIField`: Validates IMEI numbers
- `VINField`: Validates Vehicle Identification Numbers

## Form Field Properties

Each form field accepts the following common properties:
- `controller`: TextEditingController for the field
- `validate`: Boolean to enable/disable validation
- `decoration`: InputDecoration for customizing the field appearance
- `onChanged`: Callback function when field value changes

## Contributing

Contributions are welcome! If you'd like to contribute to this package, feel free to submit issues or pull requests on GitHub.

## License

This package is licensed under the MIT License. See the LICENSE file for details.