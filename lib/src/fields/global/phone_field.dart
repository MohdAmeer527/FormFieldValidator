import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneField extends StatefulWidget {
  const PhoneField(
  {super.key, 
    this.initialCountryCode,
    this.languageCode = 'en',
    this.disableAutoFillHints = false,
    this.obscureText = false,
    this.textAlign = TextAlign.left,
    this.textAlignVertical,
    this.onTap,
    this.readOnly = false,
    this.initialValue,
    this.keyboardType = TextInputType.phone,
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.style,
    this.dropdownTextStyle,
    this.onSubmitted,
    this.validator,
    this.onChanged,
    this.countries,
    this.onCountryChanged,
    this.onSaved,
    this.showDropdownIcon = true,
    this.dropdownDecoration = const BoxDecoration(),
    this.inputFormatters,
    this.enabled = true,
    this.keyboardAppearance,
    this.searchText = 'Search country',
    this.dropdownIconPosition = IconPosition.leading,
    this.dropdownIcon = const Icon(Icons.arrow_drop_down),
    this.autofocus = false,
    this.textInputAction,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.showCountryFlag = true,
    this.cursorColor,
    this.disableLengthCheck = false,
    this.flagsButtonPadding = EdgeInsets.zero,
    this.invalidNumberMessage = 'Invalid Mobile Number',
    this.cursorHeight,
    this.cursorRadius = Radius.zero,
    this.cursorWidth = 2.0,
    this.showCursor = true,
    this.pickerDialogStyle,
    this.flagsButtonMargin = EdgeInsets.zero,
  });

  final String? initialCountryCode;
  final String languageCode;
  final bool disableAutoFillHints;
  final bool obscureText;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final void Function()? onTap;
  final bool readOnly;
  final String? initialValue;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration decoration;
  final TextStyle? style;
  final TextStyle? dropdownTextStyle;
  final void Function(String)? onSubmitted;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final void Function(PhoneNumber)? onChanged;
  final List<Country>? countries;
  final Function(Country)? onCountryChanged;
  final void Function(PhoneNumber?)? onSaved;
  final bool showDropdownIcon;
  final BoxDecoration dropdownDecoration;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final Brightness? keyboardAppearance;
  final String searchText;
  final IconPosition dropdownIconPosition;
  final Icon dropdownIcon;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final AutovalidateMode autovalidateMode;
  final bool showCountryFlag;
  final Color? cursorColor;
  final bool disableLengthCheck;
  final EdgeInsetsGeometry flagsButtonPadding;
  final String? invalidNumberMessage;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final double cursorWidth;
  final bool? showCursor;
  final PickerDialogStyle? pickerDialogStyle;
  final EdgeInsets flagsButtonMargin;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      key: widget.key,
      initialCountryCode: widget.initialCountryCode,
      languageCode: widget.languageCode,
      disableAutoFillHints: widget.disableAutoFillHints,
      obscureText: widget.obscureText,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: widget.decoration,
      style: widget.style,
      dropdownTextStyle: widget.dropdownTextStyle,
      onSubmitted: widget.onSubmitted,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      showDropdownIcon: widget.showDropdownIcon,
      dropdownDecoration: widget.dropdownDecoration,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      keyboardAppearance: widget.keyboardAppearance,
      searchText: widget.searchText,
      dropdownIconPosition: widget.dropdownIconPosition,
      dropdownIcon: widget.dropdownIcon,
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      autovalidateMode: widget.autovalidateMode,
      showCountryFlag: widget.showCountryFlag,
      cursorColor: widget.cursorColor,
      disableLengthCheck: widget.disableLengthCheck,
      flagsButtonPadding: widget.flagsButtonPadding,
      invalidNumberMessage: widget.invalidNumberMessage,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorWidth: widget.cursorWidth,
      showCursor: widget.showCursor,
      pickerDialogStyle: widget.pickerDialogStyle,
      flagsButtonMargin: widget.flagsButtonMargin,
    );
  }
}
