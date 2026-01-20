import 'package:clot/screens/login/login.dart';
import 'package:clot/widgets/ctm_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:clot/constants/AppColor.dart';
import 'package:clot/widgets/btn.dart';
import 'package:clot/screens/Reset/reset.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:  (context)=>Login()));
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColor.textColor,),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Create Account',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                decoration: AppColor.inputDecoration('Full Name'),

              ),
              SizedBox(height: 16),
              CtmTextField(hint: 'Last Name', controller: TextEditingController()),

              SizedBox(height: 16,),

              CtmTextField(hint: 'Email Address', controller: TextEditingController()),

              SizedBox(height: 16,),

              CtmTextField(hint: 'Password', controller: TextEditingController()),
              SizedBox(height: 32,),
              Btn(
                onPressed: () {},
                text: 'Continue',
              ),
              SizedBox(height: 26,),
              _buildLinks(context)
           
            ],
          ),
        ),
      ),
    );
  }

 

  Widget _buildLinks(BuildContext context){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Forgot Password?',
        style: TextStyle(color: AppColor.textColor),
        children: [
          TextSpan(
            text: ' Reset',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.btnBackgroundColor,
            ),
              recognizer:TapGestureRecognizer()
              ..onTap=(){
                // Navigate to Reset Page
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Reset()));
              },
          ),

 
           
        ],
      ),
    );
  }
}