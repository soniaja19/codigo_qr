import 'package:codigo_qr/db/db_admin.dart';
import 'package:codigo_qr/models/qr_model.dart';
import 'package:codigo_qr/pages/home_page.dart';
import 'package:codigo_qr/ui/general/colors.dart';
import 'package:codigo_qr/ui/widgets/common_button_widget.dart';
import 'package:codigo_qr/ui/widgets/common_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RegisterPage extends StatelessWidget {
  String url;
  RegisterPage({required this.url});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _observationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
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
                        isRequired: true,
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      CommonTextFieldWidget(
                        hinText: "Ingresa una Observación....",
                        controller: _observationController,
                        isRequired: false,
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
                          data: url,
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CommonButtonWidget(
                onPressed: () {
                  FocusScopeNode myFocusScope = FocusScope.of(context);
                  myFocusScope.unfocus();
                  if (_formKey.currentState!.validate()) {
                    //Se utilizó la libreria intl para colocar formato a la fecha
                    DateFormat myFormat = DateFormat("dd/MM/yyy hh: mm");
                    String myDate = myFormat.format(DateTime.now());

                    QRModel mantequilla = QRModel(
                      title: _titleController.text,
                      observation: _observationController.text,
                      url: url,
                      datetime: myDate,
                    );
                    Future.delayed(const Duration(milliseconds: 400), () {
                      DBAdmin().insertQR(mantequilla).then(
                        (value) {
                          if (value >= 0) {
                            // Navigator.pop(context);
                            // Navigator.pop(context);

                            //Con está opción regresamos a la página principal, las otras pantallas se eliminan
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false);
                            //Mostar un snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                backgroundColor: Colors.white,
                                behavior: SnackBarBehavior.floating,
                                content: const Text(
                                  "Se registró tu QR correctamente",
                                  style: TextStyle(
                                    color: kBrandPrimaryColors,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    });
                  }
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
