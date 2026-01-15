import 'package:clot/constants/AppColor.dart'; // Ensure this matches your file name exactly
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We use a transparent or themed AppBar for a modern shop look
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: AppColor.backgroundColor, // Assuming you have this in constants
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
            children: [
              const SizedBox(height: 10),
              Text(
                "Home Screen",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.btnBackgroundColor,
                ),
              ),
              const SizedBox(height: 20),
              
              // This is where your Search Bar or Product Grid will go
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.btnBackgroundColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text("Promo Banner or Category")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}