import 'package:clot/widgets/bottomNav.dart';
import 'package:clot/screens/Notification/notification_empty.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   toolbarHeight: 70,
      //   // leading: const Icon(Icons.menu, color: Colors.black),
      //   title: const Text(
          // 'Clot',
          // style: TextStyle(
          //   color: Colors.black,
          //   fontSize: 20,
          //   fontWeight: FontWeight.bold,
          // ),
        // ),
        // centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
        //   ),
        // ],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        
        children: [
          const SizedBox(height: 60), 
          Align(alignment: Alignment.center, child: Text('Notification', style: TextStyle(fontWeight: FontWeight.bold),)),
          const SizedBox(height: 20),
          // const NotificationCard()
          Center(child: const EmptyNotification())

        ],
      ),
      bottomNavigationBar: const BottomNav(), 
    );
  }
} 