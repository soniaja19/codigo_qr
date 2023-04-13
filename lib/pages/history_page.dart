import 'package:codigo_qr/db/db_admin.dart';
import 'package:codigo_qr/models/qr_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
              FutureBuilder(
                //Se encarga de mostrar el historial de los qr guardados
                future: DBAdmin().getQRList(),
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    //creamos una lista con la información que hemos guardado en el QR scanner
                    List<QRModel> qrList = snap.data;
                    return ListView.builder(
                      //physics: const ScrollPhysics(),
                      physics:
                          const NeverScrollableScrollPhysics(), // para que se pueda movilizar la panatalla de arriba a bajo
                      shrinkWrap:
                          true, //Delimita la cantidad de hijos que tiene el scroll para que no se rompa la pantalla
                      itemCount: qrList
                          .length, //al crear la lista, aquí indicamos los elemetos que podemos mostrar, lo que guaradmos en  qr scanner
                      itemBuilder: (BuildContext context, int index) {
                        //Validar si es o no un url en este espacio...
                        // bool isUrl = false;
                        // if (qrList[index].url.contains("http")) {
                        //   isUrl = true;
                        // }
                        bool isUrl = qrList[index].url.contains("http");

                        ///

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
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          size: 14.0,
                                          color: Colors.white54,
                                        ),
                                        Text(
                                          " ${qrList[index].datetime}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      qrList[index].title,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      qrList[index].observation,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 14.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              isUrl
                                  ? IconButton(
                                      onPressed: () {
                                        //el Uri es el identificador de recurso, te lleva a la página
                                        Uri uri = Uri.parse(qrList[index]
                                            .url); //este es cuando es url
                                        launchUrl(uri,
                                            mode: LaunchMode
                                                .externalApplication); // es recomendame usar el LaunchMode.externalApplication porque te lleva directamente a la página o el app.
                                      },
                                      icon: const Icon(
                                        Icons.link,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const SizedBox(
                                      width: 3.0,
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
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
