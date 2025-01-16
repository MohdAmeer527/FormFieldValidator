class FormValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePhone(String? value, {int minLength = 10, int maxLength = 10}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    final cleanNumber = value.replaceAll(RegExp(r'[^\d]'), '');
    if (cleanNumber.length < minLength || cleanNumber.length > maxLength) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validateIFSC(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter IFSC code';
    }
    if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(value)) {
      return 'Invalid IFSC code format';
    }
    return null;
  }

  static String? validatePAN(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter PAN number';
    }
    if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(value)) {
      return 'Invalid PAN number format';
    }
    return null;
  }

  static String? validateGST(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter GST number';
    }
    if (!RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$').hasMatch(value)) {
      return 'Invalid GST number format';
    }
    return null;
  }
}