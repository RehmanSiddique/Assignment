import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_home_page/home_page.dart';
import 'package:login_home_page/login.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  bool _showInputs = false;
  bool _showButton = false;
  bool _showBottomText = false;

  @override
  void initState() {
    super.initState();

    // Stagger animations
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() => _showInputs = true);
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() => _showButton = true);
    });
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() => _showBottomText = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final purple = Color(0xFF9B5DE5);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Decorative top blobs
            Positioned(
              top: -40,
              right: 20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: purple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(235, 168, 252, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                  ),
                ),
              ),
            ),

            // Page content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),

                  // Title
                  Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Animated form fields
                  AnimatedOpacity(
                    opacity: _showInputs ? 1 : 0,
                    duration: Duration(milliseconds: 700),
                    child: AnimatedSlide(
                      offset: _showInputs ? Offset(0, 0) : Offset(0, 0.2),
                      duration: Duration(milliseconds: 700),
                      child: Column(
                        children: [
                          _buildInputField(
                            icon: Icons.person_outline,
                            hint: 'Full Name',
                          ),
                          const SizedBox(height: 20),
                          _buildInputField(
                            icon: Icons.email_outlined,
                            hint: 'Email',
                          ),
                          const SizedBox(height: 20),
                          _buildInputField(
                            icon: Icons.lock_outline,
                            hint: 'Password',
                            isPassword: true,
                          ),
                          const SizedBox(height: 20),
                          _buildInputField(
                            icon: Icons.lock_outline,
                            hint: 'Confirm Password',
                            isPassword: true,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Animated sign up button
                  AnimatedOpacity(
                    opacity: _showButton ? 1 : 0,
                    duration: Duration(milliseconds: 800),
                    child: AnimatedSlide(
                      offset: _showButton ? Offset(0, 0) : Offset(0, 0.3),
                      duration: Duration(milliseconds: 800),
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
                            MaterialPageRoute(builder: (_) => HomePage()),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),

                  // Animated bottom text
                  AnimatedOpacity(
                    opacity: _showBottomText ? 1 : 0,
                    duration: Duration(milliseconds: 700),
                    child: AnimatedSlide(
                      offset: _showBottomText ? Offset(0, 0) : Offset(0, 0.2),
                      duration: Duration(milliseconds: 700),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => LoginScreen(),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                  text: "Sign In",
                                  style: GoogleFonts.poppins(
                                    color: purple,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable input field builder
  Widget _buildInputField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword && !passwordVisible,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(fontSize: 14),
        prefixIcon: Icon(icon, color: Color(0xFF7C4DFF)),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
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
}
