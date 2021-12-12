import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_race1/shared/theme/app_text.dart';
import 'package:flutter_race1/shared/theme/app_theme.dart';

class InputText extends StatefulWidget {
  final String label;
  final String hint;
  final String? Function(String)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool obscure;

  const InputText({
    Key? key,
    required this.label,
    required this.hint,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.obscure = false, 
    this.keyboardType,
  }) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  String? error;

  void setError(String? error) {
    if (error != null) {
      this.error = error;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.label,
          ).label,
          SizedBox(
            height: 12,
          ),
          TextFormField(
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            style: AppTheme.textStyles.input,
            obscureText: widget.obscure,
            validator: (value) {
              if (widget.validator != null) {
                return widget.validator!(value ?? "");
              }
            },
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 16),
              hintText: widget.hint,
              hintStyle: AppTheme.textStyles.hint,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppTheme.colors.border)),
            ),
          ),
        ],
      ),
    );
  }
}
