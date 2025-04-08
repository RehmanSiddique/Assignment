import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_home_page/splash_screen.dart';

void main() => runApp(NoteTakingApp());

class NoteTakingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
