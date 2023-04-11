import 'package:codigo_qr/pages/home_page.dart';
import 'package:codigo_qr/ui/general/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:
            kBrandSecundaryColors, //Con ello estamos asignando que todas las platallas tendrán es color
        textTheme: GoogleFonts
            .montserratTextTheme(), // centralizar el estilo de la fuente
      ),
      home: HomePage(),
    );
  }
}
