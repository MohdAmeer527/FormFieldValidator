import 'package:flutter/material.dart';
import 'form_config.dart';

class FormBuilder extends StatefulWidget {
  final List<Widget> fields;
  final FormConfig config;
  final void Function(Map<String, dynamic>)? onSubmit;
  final String submitButtonText;

  const FormBuilder({
    Key? key,
    required this.fields,
    this.config = const FormConfig(),
    this.onSubmit,
    this.submitButtonText = 'Submit',
  }) : super(key: key);

  @override
  State<FormBuilder> createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      widget.onSubmit?.call(_formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: widget.config.autovalidateMode 
          ? AutovalidateMode.onUserInteraction 
          : AutovalidateMode.disabled,
      child: Padding(
        padding: widget.config.padding,
        child: Column(
          children: [
            ...widget.fields.expand((field) => [
              field,
              SizedBox(height: widget.config.fieldSpacing),
            ]).toList()
              ..removeLast(),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: Text(widget.submitButtonText),
            ),
          ],
        ),
      ),
    );
  }
}