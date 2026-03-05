import 'package:flutter/material.dart';

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
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, letterSpacing: -0.5),
            ),
            const SizedBox(height: 25),
            
            // Timeline - Fixed Logic
            buildOrderItem('Delivered', '28 May', isCompleted: false, isLast: false),
            buildOrderItem('Shipped', '27 May', isCompleted: false, isLast: false),
            buildOrderItem('In Transit', '26 May', isCompleted: true, isLast: false),
            buildOrderItem('Order Placed', '25 May', isCompleted: true, isLast: true),

            const SizedBox(height: 40),
            const Text(
              "Order items",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, letterSpacing: -0.5),
            ),
            const SizedBox(height: 15),

            // Items Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.inventory_2_outlined, size: 30, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    '4 items',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View all', style: TextStyle(color: Color(0xFF8E6CEF))),
                  )
                ],
              ),
            ),

            const SizedBox(height: 40),
            const Text(
              'Shipping details',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, letterSpacing: -0.5),
            ),
            const SizedBox(height: 15),

            // Shipping Address Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'John Doe 123 Main Street City, State, ZIP\nPhone: (123) 456-7890',
                style: TextStyle(height: 1.5, fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildOrderItem(String title, String date, {required bool isCompleted, required bool isLast}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Side: Dot and Line
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? const Color(0xFF8E6CEF) : Colors.transparent,
                  border: Border.all(
                    color: isCompleted ? const Color(0xFF8E6CEF) : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: isCompleted 
                  ? const Icon(Icons.check, size: 14, color: Colors.white) 
                  : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: isCompleted ? const Color(0xFF8E6CEF) : Colors.grey.shade800,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          
          // Right Side: Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30), // Vertical spacing between items
              ],
            ),
          ),
        ],
      ),
    );
  }
}