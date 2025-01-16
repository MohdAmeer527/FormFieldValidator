import 'src/form_config.dart';
import 'src/form_screen.dart';
import 'src/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/fields/aadhar_field.dart';
import 'src/fields/text_input_field.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Form SDK Demo',
     theme: CustomThemes.lightTheme,// Light theme settings
      darkTheme: CustomThemes.darkTheme,// Dark theme settings 
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
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();

  // Form data
  final Map<String, dynamic> _formData = {};

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    super.dispose();
  }


void _handleSubmit(Map<String, dynamic> formData) {
    // Handle form submission
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
        child: FormBuilder(
          config: const FormConfig(
         
            autovalidateMode: true,
            fieldSpacing: 20.0,
            padding: EdgeInsets.all(20.0),
          ),
          onSubmit: _handleSubmit,
          submitButtonText: 'Submit Form',
          fields: [
            // Basic text input with custom styling
            TextInputField(
              controller: _nameController,
              label: 'Full Name',
              hint: 'Enter your full name',
              isRequired: true,
              onSaved: (value) => _formData['name'] = value,
            ),

            // Email field with validation
            TextInputField(
              controller: _emailController,
              label: 'Email Address',
              hint: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              isRequired: true,
              validator: (value) {
                if (!value!.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) => _formData['email'] = value,
            ),

            // Phone field with input formatting
            TextInputField(
              controller: _phoneController,
              label: 'Phone Number',
              hint: 'Enter your phone number',
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              validator: (value) {
                if (value?.length != 10) {
                  return 'Phone number must be 10 digits';
                }
                return null;
              },
              onSaved: (value) => _formData['phone'] = value,
            ),

            // Password field
            TextInputField(
              controller: _passwordController,
              label: 'Password',
              hint: 'Enter your password',
              obscureText: true,
              isRequired: true,
              validator: (value) {
                if (value!.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
              onSaved: (value) => _formData['password'] = value,
            ),
            AadharField(controller: _passwordController, onSaved: (value ) {  },),

            // Multiline text field
            TextInputField(
              controller: _addressController,
              label: 'Address',
              hint: 'Enter your full address',
              maxLines: 3,
              onSaved: (value) => _formData['address'] = value,
            ),
          ],
        ),
      ),
    );
  }
}