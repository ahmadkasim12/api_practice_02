import 'package:api_practice_02/pages/mobile/LoginMobile.dart';
import 'package:api_practice_02/pages/mobile/RegistrarMobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginMobile()),
        GetPage(name: '/registrar', page: () => RegistrarMobile()),
      ],
    );
  }
}