import 'package:clot/screens/Orders/Order_empty.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Center(
            child: const Text("Orders", style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 70),
          Center(
            child: const OrderEmpty()
          )
          
        ],
      ),
    );
  }
}