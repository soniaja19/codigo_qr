import 'package:codigo_qr/pages/history_page.dart';
import 'package:codigo_qr/pages/scanner_pages.dart';
import 'package:codigo_qr/ui/widgets/common_button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "SaveQR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                "Gestiona los códigos QR de tu preferencia y accede cuando quieras",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Image.asset(
                "assets/images/codigo-qr.png",
                width: width * 0.8,
              ),
              CommonButtonWidget(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScannerPage()));
                },
                text: "Escanear QR",
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryPage()));
                },
                child: const Text(
                  "Ver historial",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
