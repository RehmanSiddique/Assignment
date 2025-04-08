import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';

import 'home_page.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool passwordVisible = false;

  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideIn;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideIn = Tween<Offset>(
      begin: const Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeIn,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),

                // Arc Text + Icon with animation
                ScaleTransition(
                  scale: _fadeIn,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ArcText(
                        radius: 80,
                        text: "Mobile Login System",
                        textStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xFF7C4DFF),
                          fontWeight: FontWeight.bold,
                        ),
                        startAngle: 3.14 / 1.5,
                        placement: Placement.outside,
                      ),
                      ArcText(
                        radius: 80,
                        text: "Mobile Login System",
                        textStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xFF7C4DFF),
                          fontWeight: FontWeight.bold,
                        ),
                        startAngle: -5.14 / 6,
                        placement: Placement.outside,
                      ),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF7C4DFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.phone_android_rounded,
                            size: 32, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 90),

                // Sign in text
                SlideTransition(
                  position: _slideIn,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5E17EB),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SlideTransition(
                  position: _slideIn,
                  child: Column(
                    children: [
                      _buildInputField(
                        hint: "Email or User Name",
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 20),
                      _buildInputField(
                        hint: "Password",
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget Password ?",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Sign in button with fade + scale
                ScaleTransition(
                  scale: _fadeIn,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(225, 137, 248, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 150, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                    child: Text(
                      "Sign in",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                FadeTransition(
                  opacity: _fadeIn,
                  child: Text("Or sign in With",
                      style: GoogleFonts.poppins(
                          color: Color.fromRGBO(226, 131, 250, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),

                const SizedBox(height: 15),

                // Social Icons
                FadeTransition(
                  opacity: _fadeIn,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon('assets/google.png'),
                      const SizedBox(width: 15),
                      _socialIcon('assets/facebook.png'),
                      const SizedBox(width: 15),
                      _socialIcon('assets/x-icon.webp'),
                      const SizedBox(width: 15),
                      _socialIcon('assets/linkedin.webp'),
                    ],
                  ),
                ),

                const SizedBox(height: 60),

                // Signup Row
                FadeTransition(
                  opacity: _fadeIn,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have account ? ",
                          style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Color.fromRGBO(235, 168, 252, 1),
                              fontWeight: FontWeight.w600)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text(
                          "Sing Up",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7C4DFF),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _buildInputField and _socialIcon stay the same as before
  Widget _buildInputField(
      {required String hint, required IconData icon, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword && !passwordVisible,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(fontSize: 14),
        prefixIcon: Icon(icon, color: Color(0xFF7C4DFF)),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() => passwordVisible = !passwordVisible);
                },
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(226, 131, 250, 1), width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(226, 131, 250, 1), width: 2.5),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  Widget _socialIcon(String imagePath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Image.asset(
        imagePath,
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
    );
  }
}
