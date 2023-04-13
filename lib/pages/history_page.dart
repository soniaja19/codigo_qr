import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Historial general",
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
                "Listado General de tus QR registrados",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              ListView.builder(
                //physics: const ScrollPhysics(),
                physics:
                    const NeverScrollableScrollPhysics(), // para que se pueda movilizar la panatalla de arriba a bajo
                shrinkWrap:
                    true, //Delimita la cantidad de hijos que tiene el scroll para que no se rompa la pantalla
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 14.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.09),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.calendar_month,
                                    size: 14.0,
                                    color: Colors.white54,
                                  ),
                                  Text(
                                    " 12/04/2023  20:31",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              const Text(
                                "Pasta Canteen",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              const Text(
                                "Carnes y parrillas",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.link,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.qr_code,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
