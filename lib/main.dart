import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import './helper/color_pallet.dart';
import './screens/intro.dart';
import './screens/sign_in.dart';
import 'screens/home.dart';

class GloceryApp extends StatelessWidget with ColorPallet {
  GloceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Glocery Mobile App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Intro(),
        '/signin': (context) => const SignIn(),
        '/home': (context) => const Home(),
      },
      theme: _buildThemeData(),
    );
  }

  _buildThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: lightYellow),
      tabBarTheme: TabBarTheme(
        labelColor: orange,
        unselectedLabelColor: iconColor,
      ),
      iconTheme: IconThemeData(
        color: iconColor,
        size: 30,
      ),
      textTheme: TextTheme(
          titleSmall: const TextStyle(
            color: Color(0xFF5F5F5F),
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: TextStyle(
            color: black,
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            color: black,
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          displayLarge: TextStyle(
            color: white,
            fontSize: 38,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          )),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      scaffoldBackgroundColor: homeScaffoldColor,
    );
  }
}

main() {
  runApp(GloceryApp());
}
