import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputDecoration(
          {required String hint,
          required String label,
          required IconData icon}) =>
      InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
          ),
          hintText: hint,
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintStyle: const TextStyle(color: Colors.white),
          labelStyle: const TextStyle(color: Colors.white));
}