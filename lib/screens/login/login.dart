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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isEmailEntered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar is only shown on the password screen to provide a back path
      appBar: isEmailEntered 
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: false,
              leadingWidth: 70, // Gives the button room to breathe
              leading: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  backgroundColor: const Color(0xFFF4F4F4),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 16),
                    onPressed: () => setState(() => isEmailEntered = false),
                  ),
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Large spacing for the first screen, tighter for the second
              SizedBox(height: isEmailEntered ? 20 : 80),
              
              Text(
                'Sign in',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 32),

              // Dynamic Input Fields
              if (!isEmailEntered) ...[
                TextField(
                  controller: _emailController,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration('Email Address'),
                ),
              ] else ...[
                TextField(
                  controller: _passwordController,
                  autofocus: true,
                  obscureText: true,
                  decoration: _inputDecoration('Password'),
                ),
              ],

              const SizedBox(height: 16),
              _buildLinks(context),

              // Social logins are hidden on the password step for a cleaner focus
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
      // The fixed button at the bottom
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 23, 
          right: 23, 
          bottom: MediaQuery.of(context).viewInsets.bottom + 23, // Floats above keyboard
        ),
        child: _mainButton(
          text: isEmailEntered ? 'Sign In' : 'Continue',
          onPressed: () {
            setState(() {
              if (!isEmailEntered) {
                if (_emailController.text.isNotEmpty) isEmailEntered = true;
              } else {
                // Sign in logic
              }
            });
          },
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
      filled: true,
      fillColor: const Color(0xFFF4F4F4), // A soft, elegant grey
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
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
          side: BorderSide(color: Colors.grey.withOpacity(0.15)),
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
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 14),
        children: [
          TextSpan(text: isEmailEntered ? "Forgot your password? " : "Don't have an account? "),
          TextSpan(
            text: isEmailEntered ? "Reset" : "Create One",
            style: const TextStyle(fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (isEmailEntered) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Reset()));
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  Register()));
                }
              },
          ),
        ],
      ),
    );
  }
}