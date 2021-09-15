import 'package:flutter/material.dart';

InputDecoration textFormFieldInputDecoration(Icon icon, String hint){
  return InputDecoration(
    prefixIcon: icon,
    prefixStyle: TextStyle(color: Colors.white, ),
    hintText: hint,
    helperText: ' ',
    filled: true,
    fillColor: Color(0xFF444053),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Color(0xFF6C6C6C)),
        borderRadius: BorderRadius.circular(20)),
    enabledBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20)),
  );
}