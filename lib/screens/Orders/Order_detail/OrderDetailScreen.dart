import 'package:flutter/material.dart';
// import 'package:clot/constants/AppColor.dart'; 

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Order #12345",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order Status",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: -0.5),
            ),
            const SizedBox(height: 30),
            
            // The Timeline logic
            buildOrderItem('Delivered', '28 May', isCompleted: true, isLast: false),
            buildOrderItem('Shipped', '27 May', isCompleted: true, isLast: false),
            buildOrderItem('In Transit', '26 May', isCompleted: false, isLast: false),
            buildOrderItem('Order Placed', '25 May', isCompleted: false, isLast: true),

            const SizedBox(height: 40),
            Text(
              "Order items",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: -0.5),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildOrderItem(String title, String date, {required bool isCompleted, required bool isLast}) {
    return IntrinsicHeight( // Important to make the vertical line match the height
      child: Row(
        children: [
          // Left Side: Icon and Line
          Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? const Color(0xFF8E6CEF) : Colors.white, // Using a stylish purple
                  border: Border.all(
                    color: isCompleted ? const Color(0xFF8E6CEF) : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: isCompleted 
                  ? const Icon(Icons.check, size: 16, color: Colors.white) 
                  : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: isCompleted ? const Color(0xFF8E6CEF) : Colors.grey.shade200,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          
          // Right Side: Text Content
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: isCompleted ? FontWeight.w700 : FontWeight.w500,
                    color: isCompleted ? Colors.black : Colors.grey.shade400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 60), // Spacing between steps
              ],
            ),
          ),
        ],
      ),
    );
  }
}