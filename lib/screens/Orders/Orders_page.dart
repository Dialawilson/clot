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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Orders'),
      ),
      body: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          const Text("Orders", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          Center(
            child: const OrderEmpty()
          )
          
        ],
      ),
    );
  }
}