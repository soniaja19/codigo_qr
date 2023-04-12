import 'package:codigo_qr/ui/widgets/common_button_widget.dart';
import 'package:codigo_qr/ui/widgets/common_textfield_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Registrar contenido",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              const Text(
                "Por favor ingresa los campos requeridos",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              CommonTextFieldWidget(
                hinText: "Ingresa un Titulo....",
              ),
              const SizedBox(
                height: 14.0,
              ),
              CommonTextFieldWidget(
                hinText: "Ingresa una Observación....",
              ),
              const SizedBox(
                height: 20.0,
              ),
              CommonButtonWidget(
                onPressed: () {},
                text: "Guardar",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
