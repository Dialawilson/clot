import 'package:clot/screens/login/login.dart';
import 'package:clot/widgets/ctm_textfield.dart';
import 'package:flutter/material.dart';
import 'package:clot/constants/AppColor.dart';
import 'package:clot/widgets/btn.dart';

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
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
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
                  fontSize: 32,
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
              SizedBox(height: 16,),
           
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint){
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color.fromARGB(255, 244, 244, 244),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none
      )
    );
  }
}