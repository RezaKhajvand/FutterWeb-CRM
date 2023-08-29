import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shasfacrm/const/rkconst.dart';
import 'package:shasfacrm/screens/desktope/loginpage.dart';
import 'package:shasfacrm/screens/desktope/mainpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale("fa", "IR"), // O
      theme: ThemeData(
        fontFamily: 'Anjoman',
        textTheme: const TextTheme(
          displaySmall: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontVariations: [FontVariation('wght', 500)]),
          displayMedium: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontVariations: [FontVariation('wght', 500)]),
          displayLarge: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontVariations: [FontVariation('wght', 800)]),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
        ),
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: RKConst.hintcolor),
          suffixIconColor: RKConst.hintcolor,
          fillColor: RKConst.inputcolor,
          filled: true,
          contentPadding: const EdgeInsets.only(right: 12),
          border: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: RKConst.borderRadius,
              borderSide: BorderSide.none),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            textStyle: const TextStyle(fontFamily: 'Anjoman', fontSize: 16),
            shape: RoundedRectangleBorder(borderRadius: RKConst.borderRadius),
            elevation: 0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(builder: (context, constraints) {
        // if (constraints.maxWidth <= 600) {
        return const LoginPage();
        // } else if (constraints.maxWidth < 1000 && constraints.maxWidth > 600) {
        //   return const TabletLayout();
        // } else {
        //   return const DesktopeLayout();
        // }
      }),
    );
  }
}
