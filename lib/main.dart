import 'package:flutter/material.dart';
import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(fontFamily: 'PPGoshaSans'),
          displayMedium: TextStyle(fontFamily: 'NBInternationalPro'),
          displaySmall: TextStyle(fontFamily: 'NBInternationalPro'),
        ),
      ),
      title: 'NPT Solutions',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors
            .black, // Set the background color of the entire screen to black
        body: SingleChildScrollView(
          child: Container(
            height: 1000, // o el tamaño que necesites
            child: Stack(
              children: [
                Positioned(
                  top: -270,
                  right: 0,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(pi), // volteo horizontal
                    child: Image.asset(
                      'assets/images/fondo_naranja.png',
                      width: 600,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NPT Solutions',
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'NBInternationalPro',
                          color: Colors
                              .white, // Asegúrate de que el texto sea legible
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 100, // Ajusta este valor para moverla hacia arriba
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/fondo_celulares.png',
                    width: 300,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(1),
                          Colors.black.withOpacity(1), // más oscuro abajo
                          Colors.black.withOpacity(1), // más oscuro abajo
                          Colors.transparent, // se difumina hacia arriba
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 480, // Ajusta la posición del contenido
                  left: 0,
                  right: 0,
                  child: Stack(
                    children: [
                      // Imagen de fondo
                      Positioned(
                        top: 0, // Ajusta la posición del contenido
                        left: -80,
                        right: -110,
                        child: Image.asset(
                          'assets/images/fondo_lineas.png', // Reemplaza con la ruta de tu imagen
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Texto principal
                          Container(
                            width: 320,
                            child: Text(
                              'Vive la transformación digital',
                              style: TextStyle(
                                fontSize: 32,

                                fontFamily: 'NBInternationalPro',
                                color: Colors
                                    .white, // Asegúrate de que el texto sea legible
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              '¿Tienes una idea innovadora o una necesidad específica que no puede ser cubierta por aplicaciones estándar?',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NBInternationalPro',
                                color: Colors
                                    .white, // Asegúrate de que el texto sea legible
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 32),

                          // Botones
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 52,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white, // Fondo transparente
                                    foregroundColor:
                                        Colors.black, // Texto negro
                                    side: BorderSide(
                                        color: Colors.white,
                                        width: 2), // Borde blanco
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () async {
                                    final phoneNumber = '972696048';
                                    final message = Uri.encodeComponent(
                                        "Hola, quiero agendar una llamada");
                                    final whatsappUrl = Uri.parse(
                                        "https://wa.me/51$phoneNumber?text=$message");

                                    if (await canLaunchUrl(whatsappUrl)) {
                                      await launchUrl(whatsappUrl,
                                          mode: LaunchMode.externalApplication);
                                    } else {
                                      throw 'No se pudo abrir WhatsApp';
                                    }
                                  },
                                  child: Text(
                                    'Agenda una llamada',
                                    style: TextStyle(
                                        color: Colors.black), // Texto negro
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                height: 52,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        Colors.white, // Texto blanco
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: Colors.white,
                                          width: 2), // Borde blanco
                                    ),
                                  ),
                                  onPressed: () {
                                    // Funcionalidad para el segundo botón
                                  },
                                  child: Text('Ver Portafolio'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Stack(
                //   children: [

                //   ],
                // ),

                // Contenido principal
              ],
            ),
          ),
        ),
      ),
    );
  }
}
