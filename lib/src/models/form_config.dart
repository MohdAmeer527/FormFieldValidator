import 'package:flutter/material.dart';


class FormConfig {

  final bool autovalidateMode;
  final double fieldSpacing;
  final EdgeInsets padding;

  const FormConfig({
 
    this.autovalidateMode = false,
    this.fieldSpacing = 16.0,
    this.padding = const EdgeInsets.all(16.0),
  });

  FormConfig copyWith({
  
    bool? autovalidateMode,
    double? fieldSpacing,
    EdgeInsets? padding,
  }) {
    return FormConfig(
     
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      fieldSpacing: fieldSpacing ?? this.fieldSpacing,
      padding: padding ?? this.padding,
    );
  }
}