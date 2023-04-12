import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget {
  String hinText;
  TextEditingController controller;
  bool? isRequired;
  CommonTextFieldWidget({
    required this.hinText,
    required this.controller,
    this.isRequired,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.12),
        hintText: hinText,
        hintStyle: const TextStyle(
          color: Colors.white54,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 14.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
      ),

      //Con el  return "Campo obligatorio", estamos indicando que el usuario debe llenar los campos obligatorios o de lo contrario no se registrará
      validator: (String? value) {
        if (value != null && value.isEmpty && isRequired == true) {
          return "Campo obligatorio";
        }
        return null;
      },
    );
  }
}
