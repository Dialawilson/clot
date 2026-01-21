import 'package:clot/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:clot/constants/AppColor.dart';
import 'package:clot/screens/Home/Home.dart';


class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            Image.asset('assets/img/success.png', width: 150, height: 150),
            SizedBox(height: 24),
            Center(
              child: Text(
                'We sent you an Email to reset your password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textColor,
                ),
              ),
            ),
            SizedBox(height: 16),
            Btn(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
            }, text: "Back to Home")
          ],
        ),
      ),
    ),
    );
  }
}