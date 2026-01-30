import 'package:clot/widgets/bottomNav.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text('Notification'),
      ),
      bottomNavigationBar: const BottomNav(), 
    );
  }
} 