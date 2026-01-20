import 'package:clot/constants/AppColor.dart';
import 'package:clot/widgets/btn.dart';
import 'package:flutter/material.dart';

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 223, 223, 223),
          ),
          onPressed: () {
            Navigator.pop(context);
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
                'Reset Password',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                decoration: AppColor.inputDecoration('Email Address'),

              ),
              SizedBox(height: 32,),
              Btn(
                onPressed: () {},
                text: 'Send Reset Link',
              ),
            ],
          ),
        ),
      ),
    );
  }
}