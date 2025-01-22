import 'package:flutter/material.dart';

InputDecoration customInputDecoration(String label, {String? errorText}) {
  const rulerColor = Color.fromARGB(125, 121, 85, 72);

  return InputDecoration(
    hintText: errorText ?? '$label...',
    hintStyle: TextStyle(
        color: errorText != null
            ? const Color.fromARGB(255, 151, 26, 9)
            : Colors.grey),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: rulerColor, width: 4.0),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: rulerColor, width: 4.0),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: rulerColor, width: 4.0),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide:
          BorderSide(color: const Color.fromARGB(255, 151, 26, 9), width: 4.0),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide:
          BorderSide(color: const Color.fromARGB(255, 151, 26, 9), width: 4.0),
    ),
    hoverColor: Colors.brown.withAlpha(10),
    fillColor: Colors.transparent,
    filled: true,
    errorStyle: TextStyle(fontSize: 0),
  );
}
