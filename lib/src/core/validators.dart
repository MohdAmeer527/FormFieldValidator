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

  static String? validatePhone(String? value,
      {int minLength = 10, int maxLength = 10}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    final cleanNumber = value.replaceAll(RegExp(r'[^\d]'), '');
    if (cleanNumber.length < minLength || cleanNumber.length > maxLength) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
String? validateSSN(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter SSN';
  }

  // Regular expression to match the SSN format
  final pattern = RegExp(r'^(?!666|000|9\d{2})\d{3}-(?!00)\d{2}-(?!0000)\d{4}$');

  // Check if the input matches the pattern
  if (!pattern.hasMatch(value)) {
    return 'Invalid SSN format';
  }

  return null; // Return null if the SSN is valid
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
    // Check if the value is not null or empty
    if (value == null || value.isEmpty) {
      return 'GST number cannot be empty';
    }

    // Regex to validate the GST number
    final regex =
        RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}[A-Z]{1}[0-9]{1}$');

    if (!regex.hasMatch(value)) {
      return 'Invalid GST number format';
    }

    return null; // Return null if the GST number is valid
  }

  static String? validateUPI(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter UPI ID';
    }
    if (!RegExp(r'^[a-zA-Z0-9.\-_]{2,49}@[a-zA-Z]{3,}$').hasMatch(value)) {
      return 'Invalid UPI ID format';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    if (value.trim().length < 10) {
      return 'Please enter a complete address';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.trim().split(' ').length < 2) {
      return 'Please enter your full name';
    }
    return null;
  }

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

  static String? validateVIN(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter VIN number';
    }
    if (value != null && value.isNotEmpty) {
      if (value.length != 17) {
        return 'VIN must be 17 characters';
      }
      if (!RegExp(r'^[A-HJ-NPR-Z0-9]{17}$').hasMatch(value)) {
        return 'Invalid VIN format';
      }
    }
    return null;
  }

  static String? validateBankAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter bank account number';
    }
    if (value.length < 9 || value.length > 18) {
      return 'Invalid bank account number length';
    }
    return null;
  }

  String? validateAadhaar(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Aadhaar number';
    }

    // Remove spaces, hyphens, and other non-numeric characters
    final cleanValue = value.replaceAll(RegExp(r'[\s\-]'), '');

    // Regex to check for 12-digit numeric Aadhaar number
    final pattern = RegExp(r'^[0-9]{12}$');

    // Check if the input is 12 digits long and matches the regex pattern
    if (!pattern.hasMatch(cleanValue)) {
      return 'Invalid Aadhaar number format';
    }

    return null; // Return null if the Aadhaar number is valid
  }
  String? validatePassport(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter passport number';
  }

  // Regular expression to validate the passport format
  final pattern = RegExp(r'^[A-Z][A-Z0-9][0-9]{6}$');

  // Check if the input matches the pattern
  if (!pattern.hasMatch(value)) {
    return 'Invalid passport number format';
  }

  // If valid, return null (no error)
  return null;
}


  String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter card number';
    }
    final cleanValue = value.replaceAll(' ', '');
    if (cleanValue.length != 16) {
      return 'Invalid card number';
    }
    if (!luhnCheck(cleanValue)) {
      return 'Invalid card number';
    }
    return null;
  }

  String? validateDOI(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter DOI';
    }
    if (value != null && value.isNotEmpty) {
      final regex = RegExp(r'^10\.[0-9]{4,}/[-._;()/:\w]+$');
      if (!regex.hasMatch(value)) {
        return 'Invalid DOI format';
      }
    }
    return null;
  }

  bool luhnCheck(String number) {
    int sum = 0;
    bool alternate = false;

    for (int i = number.length - 1; i >= 0; i--) {
      int n = int.parse(number[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) {
          n = (n % 10) + 1;
        }
      }
      sum += n;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }

  String? validateIMEI(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter IMEI number';
    }

    // Remove any spaces or non-numeric characters
    final cleanValue = value.replaceAll(RegExp(r'[^0-9]'), '');

    // Check if the length is 15 digits
    if (cleanValue.length != 15) {
      return 'IMEI number must be 15 digits long';
    }

    // Apply the Luhn algorithm to validate the IMEI number
    if (!isValidIMEI(cleanValue)) {
      return 'Invalid IMEI number';
    }

    return null; // Return null if the IMEI number is valid
  }

// Luhn Algorithm to check IMEI number validity
  bool isValidIMEI(String imei) {
    int sum = 0;
    bool alternate = false;

    // Iterate over the digits from right to left
    for (int i = imei.length - 1; i >= 0; i--) {
      int digit = int.parse(imei[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) digit -= 9; // Subtract 9 if the digit is greater than 9
      }

      sum += digit;
      alternate = !alternate; // Alternate between even and odd positions
    }

    return sum % 10 == 0; // IMEI is valid if the sum is divisible by 10
  }
}
