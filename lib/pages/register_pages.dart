import 'package:codigo_qr/models/qr_model.dart';
import 'package:codigo_qr/ui/widgets/common_button_widget.dart';
import 'package:codigo_qr/ui/widgets/common_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _observationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
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
                      controller: _titleController,
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    CommonTextFieldWidget(
                      hinText: "Ingresa una Observación....",
                      controller: _observationController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: QrImage(
                        data:
                            "https://pub.dev/packages/qr_code_scanner/install",
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ),

                    // const Expanded(
                    //   child: SizedBox(),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CommonButtonWidget(
                onPressed: () {
                  //Se utilizó la libreria intl para colocar formato a la fecha
                  DateFormat myFormat = DateFormat("dd/MM/yyy hh: mm");
                  String myDate = myFormat.format(DateTime.now());

                  QRModel mantequilla = QRModel.fromJson(
                    {
                      "title": _titleController.text,
                      "observation": _observationController.text,
                      "url": "hptt//...",
                      "datetime": myDate,
                    },
                  );
                  print(DateTime.now());
                  print(mantequilla.toJson());
                },
                text: "Guardar",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
