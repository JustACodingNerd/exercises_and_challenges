import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'validators.dart';
import 'custom_input_decorations.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final bool isRequired;
  final TextEditingController? controller;
  final TextEditingController? confirmPasswordController;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.isRequired = false,
    this.controller,
    this.confirmPasswordController,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.notoSerif(
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
          TextFormField(
            controller: widget.controller,
            obscureText: widget.label == 'Password' ||
                widget.label == 'Confirm Password',
            decoration: customInputDecoration(
              widget.label,
              errorText: errorText,
            ),
            validator: (value) {
              String? validationResult;
              if (widget.isRequired) {
                if (widget.label == 'Confirm Password' &&
                    widget.confirmPasswordController != null) {
                  validationResult = confirmPasswordValidator(
                      value, widget.confirmPasswordController!.text);
                } else {
                  final validator = validators[widget.label];
                  if (validator != null) {
                    validationResult = validator(value);
                  }
                }
              }
              setState(() {
                errorText = validationResult;
              });
              return validationResult;
            },
            onChanged: (value) {
              setState(() {
                errorText = Form.of(context).validate()
                    ? null
                    : 'Please enter ${widget.label}';
              });
            },
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
