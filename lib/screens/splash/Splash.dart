import 'package:clot/screens/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:clot/constants/AppColor.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    if (!mounted) return;
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.btnBackgroundColor,
      body: Center(
        // 2. Added the missing 'child:' parameter here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/clot.png',
              width: 100,
              height: 100,
              // Optional: If your SVG is black, make it white to match your brand
              // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}