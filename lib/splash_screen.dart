import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack, // smooth bounce effect
    );

    _controller.forward();

    // Optional: Navigate to next screen after animation completes
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  }

  Widget buildArcText() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Top arc text
        ArcText(
          radius: 80,
          text: " Mobile Login System",
          textStyle: GoogleFonts.poppins(
              fontSize: 15,
              color: Color(0xFF7C4DFF),
              fontWeight: FontWeight.w900),
          startAngle: 3.14 / 1.5,
          placement: Placement.outside,
        ),
        // Bottom arc text
        ArcText(
          radius: 80,
          text: "Mobile Login System",
          textStyle: GoogleFonts.poppins(
              fontSize: 15,
              color: Color(0xFF7C4DFF),
              fontWeight: FontWeight.w900),
          startAngle: -5.14 / 6,
          placement: Placement.outside,
        ),

        // Icon in center
        Icon(Icons.phone_android_rounded, size: 100, color: Color(0xFF7C4DFF)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top-left curved shape
          Positioned(
            top: -215,
            left: -40,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 168, 252, 1),
                borderRadius: BorderRadius.circular(250),
              ),
            ),
          ),
          Positioned(
            top: -150,
            right: -95,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(400),
              ),
            ),
          ),

          // Bottom-right curved shape
          Positioned(
            bottom: -250,
            left: -70,
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(400),
              ),
            ),
          ),
          Positioned(
            bottom: -200,
            right: -150,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 168, 252, 1),
                borderRadius: BorderRadius.circular(250),
              ),
            ),
          ),
          // Fade-in center content
          Center(
            child: FadeTransition(
              opacity: _animation,
              child: ScaleTransition(
                scale: _animation,
                child: buildArcText(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
