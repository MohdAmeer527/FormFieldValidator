class FormValidators {
  static String? validateDrivingLicense(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter driving license number';
    }

    final cleanValue = value.replaceAll(RegExp(r'[\s-]'), '');
    final pattern = RegExp(r'^[A-Z]{2}[0-9]{2}[0-9]{4}[0-9]{7}$');

    if (cleanValue.length != 15) {
      return 'Driving license must be 15 characters long';
    }

    if (!pattern.hasMatch(cleanValue)) {
      return 'Invalid driving license format. Format: SS-RR-YYYY-NNNNNNN';
    }

    return null;
  }

  static String? validateGST(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$').hasMatch(value)) {
        return 'Please enter a valid GST number';
      }
    }
    return null;
  }
}