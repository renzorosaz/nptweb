import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  final PageController _pageControllerPortafolio =
      PageController(viewportFraction: 0.85);
  final ScrollController _scrollController = ScrollController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  int _currentIndexPortafolio = 0;
  final GlobalKey _portafolioKey = GlobalKey();

  final logos = [
    'assets/logos/open.png',
    'assets/logos/stef.png',
    'assets/logos/kal.png',
    'assets/logos/miski.png',
  ];
  final partners = [
    'assets/partners/aws.png',
    'assets/partners/figma.png',
    'assets/partners/flutter.png',
    'assets/partners/python.png',
    'assets/partners/whatsapp.png',
  ];

  final portafolio = [
    {
      'imagen': 'assets/portafolio/aw_1.png',
      'titulo': 'GreenPlace - Catálogo Digital',
      'descripcion':
          'Aplicación móvil que permite a negocios mostrar su catálogo de productos de forma digital, ordenada y accesible desde cualquier dispositivo.',
    },
    {
      'imagen': 'assets/portafolio/aw_2.png',
      'titulo': 'FuchiGol - Partidos Amistosos',
      'descripcion':
          'Plataforma móvil para conectar jugadores y organizar partidos de fútbol recreativo de forma rápida, geolocalizada y colaborativa.',
    },
    {
      'imagen': 'assets/portafolio/aw_3.png',
      'titulo': 'Rutus - Reservas de Excursiones',
      'descripcion':
          'App para la gestión de reservas de actividades turísticas y excursiones, con integración de pasarela de pago segura y confirmación automática.',
    },
    {
      'imagen': 'assets/portafolio/aw_4.png',
      'titulo': 'Mi Negocio App',
      'descripcion':
          'Aplicación con geolocalización integrada para ayudar a emprendedores a gestionar sus negocios locales, promociones y presencia digital.',
    },
    {
      'imagen': 'assets/portafolio/aw_5.png',
      'titulo': 'Alerta de Métricas - Monitoreo Inteligente',
      'descripcion':
          'App de visualización de indicadores clave de negocio (KPIs) mediante gráficos dinámicos y alertas automáticas en tiempo real.',
    },
    {
      'imagen': 'assets/portafolio/aw_6.png',
      'titulo': 'ERP Lite - Gestión Empresarial',
      'descripcion':
          'Aplicación ligera para pequeñas empresas, que permite controlar inventarios, ventas, finanzas y operaciones desde el celular',
    },
    {
      'imagen': 'assets/portafolio/aw_7.png',
      'titulo': 'ReservApp - Sistema de Reservas',
      'descripcion':
          'Herramienta móvil diseñada para la gestión eficiente de reservas en negocios de servicios, como salones, clínicas o actividades recreativas.',
    },
  ];

  final testimonials = [
    {
      'name': 'Miskimayo',
      'position': 'App móvil iOS',
      'testimonial':
          '"Trabajamos con ellos en el desarrollo de una app para nuestra empresa minera de fosfato. Supieron adaptarse a los requerimientos de una operación compleja, y lograron digitalizar procesos clave con una solución eficiente y escalable."',
    },
    {
      'name': 'Kallpa',
      'position': 'iOS y Android',
      'testimonial':
          '"Colaboramos en una solución móvil para una de nuestras divisiones de energía. Destacamos su rapidez, calidad técnica y comprensión del sector. Nos entregaron una app sólida y alineada con nuestros objetivos operativos."',
    },
    {
      'name': 'Openmed',
      'position': 'Validación de MVP y mercado',
      'testimonial':
          '"Como empresa distribuidora de medicamentos, necesitábamos validar un nuevo modelo digital. Con su ayuda, creamos un marketplace funcional que nos permitió testear y validar la demanda en tiempo récord."',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageControllerPortafolio.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'PPNeueMachina',
            fontWeight: FontWeight.w900,
            fontSize: 32,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontFamily: 'PPGoshaSans',
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(
            fontFamily: 'NBInternationalPro',
          ),
        ),
      ),
      title: 'NPT Solutions',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey, // Asigna la clave aquí

        appBar: AppBar(
          backgroundColor: Colors.transparent, // ← Fondo transparente real
          elevation: 0, // ← Sin sombra
          automaticallyImplyLeading: false,
          title: Container(
            color: Colors.transparent, // ← Esto elimina el fondo negro

            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'NPT Solutions',
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'NBInternationalPro',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  'NPT Solutions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Servicios'),
                onTap: () {
                  Navigator.of(_scaffoldKey.currentContext!)
                      .pop(); // Use the _scaffoldKey context
                  _scrollController.animateTo(
                    2800,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              ListTile(
                title: Text('Portafolios'),
                onTap: () {
                  Navigator.of(_scaffoldKey.currentContext!).pop();
                  _scrollController.animateTo(
                    3700,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              ListTile(
                title: Text('Testimonios'),
                onTap: () {
                  Navigator.of(_scaffoldKey.currentContext!).pop();
                  _scrollController.animateTo(
                    4150,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              ListTile(
                title: Text('Contacto'),
                onTap: () {
                  Navigator.of(_scaffoldKey.currentContext!).pop();
                  _scrollController.animateTo(
                    4800,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors
            .black, // Set the background color of the entire screen to black
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            height: 5300, // o el tamaño que necesites
            child: Stack(children: [
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
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'NPT Solutions',
              //         style: TextStyle(
              //           fontSize: 23,
              //           fontFamily: 'NBInternationalPro',
              //           color: Colors
              //               .white, // Asegúrate de que el texto sea legible
              //         ),
              //         textAlign: TextAlign.center,
              //       ),
              //       IconButton(
              //         onPressed: () {
              //           _scaffoldKey.currentState
              //               ?.openDrawer(); // Usamos la clave para abrir el drawer
              //         },
              //         icon: Icon(
              //           Icons.menu,
              //           color: Colors.white,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
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
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(1),
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
                      left: -83,
                      right: -123,
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
                              fontFamily: 'PPNeueMachina',
                              fontWeight: FontWeight.w900, // Ultrabold
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
                                  foregroundColor: Colors.black, // Texto negro
                                  side: BorderSide(
                                      color: Colors.white,
                                      width: 2), // Borde blanco
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {
                                  openWhatsApp(phoneNumber: '972696048');
                                },
                                child: Text(
                                  'Agenda una llamada',
                                  style: TextStyle(
                                      fontFamily: 'NBInternationalPro',
                                      color: Colors.black), // Texto negro
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Container(
                              height: 52,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white, // Texto blanco
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                        color: Colors.white,
                                        width: 2), // Borde blanco
                                  ),
                                ),
                                onPressed: () {
                                  _scrollController.animateTo(
                                    3750,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Text(
                                  'Ver Portafolio',
                                  style: TextStyle(
                                      fontFamily: 'NBInternationalPro',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 880, // Ajusta la posición del contenido
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      width: 320,
                      child: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Colors.white, Colors.grey],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds),
                        child: Text(
                          'Nuestros clientes',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'NBInternationalPro',
                            fontWeight: FontWeight.w900, // Ultrabold
                            color: Colors
                                .white, // Asegúrate de que el texto sea legible
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100, // Set the explicit height for the carousel
                      child: Stack(
                        children: [
                          // The ListView for logos
                          ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics:
                                const BouncingScrollPhysics(), // For better UX
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: logos.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 90, // fixed or dynamic width
                                child: Image.asset(
                                  logos[index],
                                  fit: BoxFit.contain,
                                  height: 15,
                                ),
                              );
                            },

                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 32),
                          ),
                          // Left gradient mask
                          Positioned(
                            left: 0,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width:
                                  50, // Adjust this width for the gradient effect
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(1),
                                    Colors.black.withOpacity(0.7),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                          ),
                          // Right gradient mask
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width:
                                  50, // Adjust this width for the gradient effect
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(1),
                                    Colors.black.withOpacity(0.7),
                                  ],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 1110, // Ajusta la posición del contenido
                left: 0,
                right: 0,
                child: Stack(
                  children: [
                    // Imagen de fondo
                    Positioned(
                      top: 0, // Ajusta la posición del contenido
                      left: -40,
                      right: -50,
                      child: Image.asset(
                        'assets/images/fondo_lineas.png', // Reemplaza con la ruta de tu imagen
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Texto principal
                          Container(
                            width: 320,
                            child: Text(
                              '¿Cómo empezar?',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'NBInternationalPro',
                                fontWeight: FontWeight.w900, // Ultrabold
                                color: const Color.fromARGB(255, 200, 200,
                                    200), // Asegúrate de que el texto sea legible
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            width: 250,
                            child: ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: [Colors.white, Colors.grey],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ).createShader(bounds),
                              child: Text(
                                'Nuestras etapas para construir',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: 'NBInternationalPro',
                                  fontWeight: FontWeight.w900, // Ultrabold
                                  color: Colors
                                      .white, // Asegúrate de que el texto sea legible
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 140),
                          SizedBox(
                            width: 340,
                            height: 340, // Ajusta según tu diseño
                            child: Stack(
                              children: [
                                // Imagen con zoom
                                Positioned.fill(
                                  child: Transform.scale(
                                    scale: 1.55,
                                    child: Image.asset(
                                      height: 100,
                                      'assets/images/apps.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // Gradiente que cubre hasta la mitad de la imagen desde abajo
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  height:
                                      170, // justo la mitad de los 340 de altura
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(1),
                                          Colors.black.withOpacity(1),
                                          Colors.black.withOpacity(1),
                                          Colors.black.withOpacity(1),
                                          Colors.black.withOpacity(0.8),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 1660, // Ajusta la posición del contenido
                left: 40,
                right: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Número grande a la izquierda
                          Text(
                            "1",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Línea vertical con gradiente + contenido
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Línea con gradiente
                                Container(
                                  width: 2,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.grey.shade300,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),

                                // Contenido (ícono + texto)
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Ícono
                                      Image.asset(
                                        'assets/icons/op1.png',
                                        width: 44,
                                        height: 44,
                                      ),
                                      const SizedBox(height: 8),

                                      // Título y descripción
                                      Container(
                                        width: 210,
                                        child: Text(
                                          "Acercamiento y Analisis inicial",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'NBInternationalPro',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Estudiamos a fondo tu negocio para comprender su situación actual y establecer un enfoque estratégico.",
                                        style: TextStyle(
                                          letterSpacing: 0.2,
                                          fontSize: 16,
                                          fontFamily: 'NBInternationalPro',
                                          color: const Color.fromARGB(
                                              255, 152, 152, 152),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Número grande a la izquierda
                          Text(
                            "2",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Línea vertical con gradiente + contenido
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Línea con gradiente
                                Container(
                                  width: 2,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.grey.shade300,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),

                                // Contenido (ícono + texto)
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Ícono
                                      Image.asset(
                                        'assets/icons/op2.png',
                                        width: 44,
                                        height: 44,
                                      ),
                                      const SizedBox(height: 8),

                                      // Título y descripción
                                      Container(
                                        width: 400,
                                        child: Text(
                                          "Diagnóstico e Identificación de Problemas",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'NBInternationalPro',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Evaluamos los desafíos clave para detectar áreas de mejora y oportunidades de optimización.",
                                        style: TextStyle(
                                          letterSpacing: 0.2,
                                          fontSize: 16,
                                          fontFamily: 'NBInternationalPro',
                                          color: const Color.fromARGB(
                                              255, 152, 152, 152),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Número grande a la izquierda
                          Text(
                            "3",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Línea vertical con gradiente + contenido
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Línea con gradiente
                                Container(
                                  width: 2,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.grey.shade300,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),

                                // Contenido (ícono + texto)
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Ícono
                                      Image.asset(
                                        'assets/icons/op3.png',
                                        width: 44,
                                        height: 44,
                                      ),
                                      const SizedBox(height: 8),

                                      // Título y descripción
                                      Container(
                                        width: 300,
                                        child: Text(
                                          "Desarrollo de Solución Personalizada",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'NBInternationalPro',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Creamos una propuesta de solución a medida, diseñada para abordar tus necesidades específicas.",
                                        style: TextStyle(
                                          letterSpacing: 0.2,
                                          fontSize: 12,
                                          fontFamily: 'NBInternationalPro',
                                          color: const Color.fromARGB(
                                              255, 152, 152, 152),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Número grande a la izquierda
                          Text(
                            "4",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Línea vertical con gradiente + contenido
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Línea con gradiente
                                Container(
                                  width: 2,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.grey.shade300,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),

                                // Contenido (ícono + texto)
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Ícono
                                      Image.asset(
                                        'assets/icons/op4.png',
                                        width: 44,
                                        height: 44,
                                      ),
                                      const SizedBox(height: 8),

                                      // Título y descripción
                                      Container(
                                        width: 300,
                                        child: Text(
                                          "Pruebas internas y despliegue",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'NBInternationalPro',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Realizamos pruebas rigurosas y implementamos la solución en tu entorno para asegurar su funcionamiento perfecto.",
                                        style: TextStyle(
                                          letterSpacing: 0.2,
                                          fontSize: 16,
                                          fontFamily: 'NBInternationalPro',
                                          color: const Color.fromARGB(
                                              255, 152, 152, 152),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Número grande a la izquierda
                          Text(
                            "5",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Línea vertical con gradiente + contenido
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Línea con gradiente
                                Container(
                                  width: 2,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.grey.shade300,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),

                                // Contenido (ícono + texto)
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Ícono
                                      Image.asset(
                                        'assets/icons/op5.png',
                                        width: 44,
                                        height: 44,
                                      ),
                                      const SizedBox(height: 8),

                                      // Título y descripción
                                      Container(
                                        width: 300,
                                        child: Text(
                                          "Entrega y cierre de proyecto",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontFamily: 'NBInternationalPro',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Te proporcionamos todos los accesos, enlaces y documentación necesaria para finalizar el proyecto con éxito.",
                                        style: TextStyle(
                                          letterSpacing: 0.2,
                                          fontSize: 16,
                                          fontFamily: 'NBInternationalPro',
                                          color: const Color.fromARGB(
                                              255, 152, 152, 152),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 2850, // Ajusta la posición del contenido
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Fila superior con 2 contenedores
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 320,
                      child: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Colors.white, Colors.grey],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds),
                        child: Text(
                          'Nuestros servicios',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'NBInternationalPro',
                            fontWeight: FontWeight.w900, // Ultrabold
                            color: Colors
                                .white, // Asegúrate de que el texto sea legible
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Contenedor 1
                        Container(
                          width: 180,
                          height: 260,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/icons/risk.png"),
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [Colors.white, Colors.grey],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(bounds),
                                child: Text(
                                  'Soluciones Webs',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'NBInternationalPro',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                  'Creamos soluciones web personalizadas que optimizan la experiencia de tus usuarios y potencian el crecimiento de tu empresa.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'NBInternationalPro',
                                  )),
                            ],
                          ),
                        ),
                        // Contenedor 2
                        Container(
                          width: 180,
                          height: 260,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/icons/apps.png"),
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [Colors.white, Colors.grey],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(bounds),
                                child: Container(
                                  width: 120,
                                  child: Text(
                                    'Aplicaciones Android & iOS',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: 'NBInternationalPro',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                  'Creamos apps móviles modernas con una sola base de código. Fideliza a tus clientes con una experiencia fluida, rápida y lista para publicar en tiendas.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'NBInternationalPro',
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16), // Espacio entre filas
                    // Fila inferior con 2 contenedores
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Contenedor 3
                        Container(
                          width: 180,
                          height: 260,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/icons/cons.png"),
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [Colors.white, Colors.grey],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(bounds),
                                child: Container(
                                  width: 120,
                                  child: Text(
                                    'Consultoria de innovación',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: 'NBInternationalPro',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                  'Convertimos tus ideas en productos digitales, enfocándonos en lo que agrega valor y acelerando el desarrollo con metodologías ágiles.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'NBInternationalPro',
                                  )),
                            ],
                          ),
                        ),
                        // Contenedor 4
                        Container(
                          width: 180,
                          height: 260,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/icons/ia.png"),
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [Colors.white, Colors.grey],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(bounds),
                                child: Container(
                                  width: 120,
                                  child: Text(
                                    'IA Generativa',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: 'NBInternationalPro',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                  'Integra soluciones de inteligencia artificial para personalizar la experiencia de tus usuarios y automatizar procesos clave que aumentan tu eficiencia',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontFamily: 'NBInternationalPro',
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 3600, // Ajusta la posición del contenido
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      width: 320,
                      child: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Colors.white, Colors.grey],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds),
                        child: Text(
                          'Nuestros partners',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'NBInternationalPro',
                            fontWeight: FontWeight.w900, // Ultrabold
                            color: Colors
                                .white, // Asegúrate de que el texto sea legible
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100, // Set the explicit height for the carousel
                      child: Stack(
                        children: [
                          // The ListView for logos
                          ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics:
                                const BouncingScrollPhysics(), // For better UX
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: partners.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 90, // fixed or dynamic width
                                child: Image.asset(
                                  partners[index],
                                  fit: BoxFit.contain,
                                  height: 15,
                                ),
                              );
                            },

                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 32),
                          ),
                          // Left gradient mask
                          Positioned(
                            left: 0,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width:
                                  50, // Adjust this width for the gradient effect
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(1),
                                    Colors.black.withOpacity(0.7),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                          ),
                          // Right gradient mask
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width:
                                  50, // Adjust this width for the gradient effect
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(1),
                                    Colors.black.withOpacity(0.7),
                                  ],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                key: _portafolioKey,
                top: 3800,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    Container(
                      width: 320,
                      child: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Colors.white, Colors.grey],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds),
                        child: Text(
                          'Portafolio',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'NBInternationalPro',
                            fontWeight: FontWeight.w900, // Ultrabold
                            color: Colors
                                .white, // Asegúrate de que el texto sea legible
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 320,
                      child: Text(
                        'Nuestros proyectos más destacados',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'NBInternationalPro',
                          fontWeight: FontWeight.normal, // Ultrabold
                          color: const Color.fromARGB(255, 200, 200,
                              200), // Asegúrate de que el texto sea legible
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 430,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: portafolio.length,
                        onPageChanged: (index) {
                          setState(() => _currentIndexPortafolio = index);
                        },
                        itemBuilder: (context, index) {
                          final product = portafolio[index];
                          return Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.center, // Imagen centrada

                            children: [
                              Expanded(
                                child: Image.asset(
                                  product['imagen']!,
                                  fit: BoxFit.contain,
                                  height: 15,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: double
                                    .infinity, // Ocupa todo el ancho para alinear a la izquierda
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),

                                child: Text(
                                  product['titulo']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  product['descripcion']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[300],
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 23),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        portafolio.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: _currentIndexPortafolio == index ? 18 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentIndexPortafolio == index
                                ? Colors.grey
                                : Colors.grey[600],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 4400,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    Container(
                      width: 320,
                      child: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Colors.white, Colors.grey],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds),
                        child: Text(
                          'Recomendado por nuestros clientes',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'NBInternationalPro',
                            fontWeight: FontWeight.w900, // Ultrabold
                            color: Colors
                                .white, // Asegúrate de que el texto sea legible
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 220,
                      child: PageView.builder(
                        controller: _pageControllerPortafolio,
                        itemCount: testimonials.length,
                        onPageChanged: (index) {
                          setState(() => _currentIndex = index);
                        },
                        itemBuilder: (context, index) {
                          final testimonial = testimonials[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 19, 20, 20),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    testimonial['testimonial']!,
                                    style: const TextStyle(
                                      color: Colors.white60,
                                      fontSize: 12,
                                      fontFamily: 'NBInternationalPro',
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        testimonial['name'] ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'NBInternationalPro',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        testimonial['position'] ?? '',
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontFamily: 'NBInternationalPro',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        testimonials.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: _currentIndex == index ? 18 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? Colors.grey
                                : Colors.grey[600],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 4800,
                left: 40,
                right: 40,
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: const Color(0xFF1A1A1A),
                  //   borderRadius: BorderRadius.circular(16),
                  //   border: Border.all(color: Colors.grey.shade800),
                  // ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo o título
                      Divider(color: Colors.grey.shade700),
                      Text(
                        'NPT Solutions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Descripción o enlaces
                      Text(
                        'Brindamos soluciones de innovación y desarrollo a medida, junto a una red de expertos LATAM',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Enlaces de navegación
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                'San Borja, Lima, PERU',
                                style: TextStyle(
                                    fontFamily: 'NBInternationalPro',
                                    color: Colors.white54,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.person, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                'Renzo Rosas',
                                style: TextStyle(
                                    fontFamily: 'NBInternationalPro',
                                    color: Colors.white54,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.phone, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                '+51 972 696 048',
                                style: TextStyle(
                                    fontFamily: 'NBInternationalPro',
                                    color: Colors.white54,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.email, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                'nptlatamsolutions@gmail.com',
                                style: TextStyle(
                                    fontFamily: 'NBInternationalPro',
                                    color: Colors.white54,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      Text(
                        'Redes Sociales',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchLinkedIn(context);
                            },
                            child: Text(
                              'LinkedIn',
                              style: TextStyle(
                                  fontFamily: 'NBInternationalPro',
                                  color: Colors.white54,
                                  fontSize: 12),
                            ),
                          ),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              _launchInstagram(context);
                            },
                            child: Text(
                              'Instagram',
                              style: TextStyle(
                                  fontFamily: 'NBInternationalPro',
                                  color: Colors.white54,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      // // Derechos reservados
                      // Divider(color: Colors.grey.shade700),
                      const SizedBox(height: 25),

                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily:
                                'NBInternationalPro', // Replace if needed
                          ),
                          children: const [
                            TextSpan(
                                text: 'Made by ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.white30,
                                )),
                            TextSpan(
                              text: 'NPT Solutions\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // TextSpan(
                            //     text: '. Designed By ',
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.w100,
                            //       color: Colors.white30,
                            //     )),
                            // TextSpan(
                            //   text: 'Angel Meza\n',
                            //   style: TextStyle(fontWeight: FontWeight.w500),
                            // ),

                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(text: '    '), // Spacer
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchLinkedIn(BuildContext context) async {
  const url =
      'https://www.linkedin.com/company/82621706/admin/dashboard/'; // Replace with your actual LinkedIn URL
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('No se pudo abrir LinkedIn.')),
    );
  }
}

Future<void> _launchInstagram(BuildContext context) async {
  const url =
      'https://www.instagram.com/nptsolutions?igsh=czBlYW5scTBsbHp2'; // Reemplaza con tu URL real
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('No se pudo abrir Instagram.')),
    );
  }
}

Future<void> openWhatsApp(
    {required String phoneNumber,
    String message = "Hola, quiero agendar una llamada"}) async {
  final encodedMessage = Uri.encodeComponent(message);
  final whatsappUrl =
      Uri.parse("https://wa.me/51$phoneNumber?text=$encodedMessage");

  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
  } else {
    throw 'No se pudo abrir WhatsApp';
  }
}
