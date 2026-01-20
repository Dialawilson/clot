import 'package:clot/screens/Register/Register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clot/constants/AppColor.dart';
import 'package:clot/screens/Reset/reset.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controllers to capture user input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // State variable to toggle between Email and Password views
  bool isEmailEntered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 1. Back button appears only when on the password screen
      appBar: isEmailEntered 
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              
              
              leading: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 223, 223, 223),
                ),
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
                onPressed: () => setState(() => isEmailEntered = false),
              ),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Adjust spacing based on whether AppBar is present
              SizedBox(height: isEmailEntered ? 20 : 60),
              
              Text(
                'Sign in',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),

              // 2. Conditional UI: Show Email or Password Field
              if (!isEmailEntered) ...[
                // EMAIL VIEW
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration('Email Address'),
                ),
              ] else ...[
                // PASSWORD VIEW
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: _inputDecoration('Password'),
                ),
              ],

              const SizedBox(height: 16),

              // 3. Main Action Button
              _mainButton(
                text: isEmailEntered ? "Login" : "Continue",
                onPressed: () {
                  setState(() {
                    if (!isEmailEntered) {
                      // Check if email is provided before moving to password
                      if (_emailController.text.isNotEmpty) {
                        isEmailEntered = true;
                      }
                    } else {
                      // Login Logic Here
                      print("Login with: ${_emailController.text} and ${_passwordController.text}");
                    }
                  });
                },
              ),

              const SizedBox(height: 16),

              // 4. Sign Up Link (and Forgot Password if on password screen)
              _buildLinks(context),
              const SizedBox(height: 75),

              // 5. Social Logins (Only show on the first screen)
              if (!isEmailEntered) ...[
                const SizedBox(height: 40),
                _socialButton(
                  label: "Continue with Apple",
                  assetPath: 'assets/img/apple.png',
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                _socialButton(
                  label: "Continue with Google",
                  assetPath: 'assets/svg/Google.svg',
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                _socialButton(
                  label: "Continue with Facebook",
                  assetPath: 'assets/img/Fb.png',
                  onTap: () {},
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color.fromARGB(255, 244, 244, 244),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _mainButton({required String text, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.btnBackgroundColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 0,
        ),
        child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _socialButton({required String label, required String assetPath, required VoidCallback onTap}) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          side: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: assetPath.endsWith('.svg')
                  ? SvgPicture.asset(assetPath)
                  : Image.asset(assetPath),
            ),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildLinks(BuildContext context) {
    if (isEmailEntered) {
      return RichText(
        
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 14),
          children: [
          const TextSpan(text: "Forgot your password? "),
          TextSpan(
            text: " Reset",
            style: const TextStyle(fontWeight: FontWeight.bold,
            color: AppColor.btnBackgroundColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to ForgotPasswordPage()
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Reset()));
              },
          ),
        ]),
      );
    }
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 14),
        children: [
          const TextSpan(text: "Don't have an account? "),
          TextSpan(
            text: "Create One",
            style: const TextStyle(fontWeight: FontWeight.bold,
            color: AppColor.btnBackgroundColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to RegisterPage()
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
              },
          ),
        ],
      ),
    );
  }
}