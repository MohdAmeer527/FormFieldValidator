import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFields {
  static Widget buildNameField({
    required TextEditingController controller,
    required Function(String?) onSaved,
  }) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Name *',
        hintText: 'Enter your full name',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  static Widget buildEmailField({
    required TextEditingController controller,
    required Function(String?) onSaved,
  }) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Email *',
        hintText: 'Enter your email',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  static Widget buildPhoneField({
    required TextEditingController controller,
    required Function(String?) onSaved,
  }) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Phone Number *',
        hintText: 'Enter your phone number',
      ),
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        if (value.length != 10) {
          return 'Phone number must be 10 digits';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  static Widget buildAadharField({
    required TextEditingController controller,
    required Function(String?) onSaved,
  }) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Aadhar Number',
        hintText: 'Enter 12-digit Aadhar number',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(12),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty && value.length != 12) {
          return 'Aadhar number must be 12 digits';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  static Widget buildPanField({
    required TextEditingController controller,
    required Function(String?) onSaved,
  }) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'PAN Number',
        hintText: 'Enter PAN number',
      ),
      textCapitalization: TextCapitalization.characters,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9]')),
      ],
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(value)) {
            return 'Please enter a valid PAN number';
          }
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}