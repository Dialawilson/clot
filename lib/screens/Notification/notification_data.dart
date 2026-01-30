import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationData extends StatelessWidget {
  const NotificationData({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16), 
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              backgroundBlendMode: BlendMode.src,
              borderRadius: BorderRadius.circular(12),
              
              
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Icon(Icons.notifications, color: const Color.fromARGB(255, 54, 54, 54)),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: const Icon(Icons.circle, color: Colors.red, size: 12),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 300,
                  child: const Text(
                    'Gilbert, you placed and order check your order history for full details',
                    style: TextStyle(
                      fontSize: 13,     
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
       Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              backgroundBlendMode: BlendMode.src,
              borderRadius: BorderRadius.circular(12),
              
              
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Icon(Icons.notifications, color: const Color.fromARGB(255, 54, 54, 54)),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: const Icon(Icons.circle, color: Colors.red, size: 12),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 300,
                  child: const Text(
                    'Gilbert, you placed and order check your order history for full details',
                    style: TextStyle(
                      fontSize: 13,     
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 10),
        Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              backgroundBlendMode: BlendMode.src,
              borderRadius: BorderRadius.circular(12),
              
              
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Icon(Icons.notifications, color: const Color.fromARGB(255, 54, 54, 54)),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: const Icon(Icons.circle, color: Colors.red, size: 12),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 300,
                  child: const Text(
                    'Gilbert, you placed and order check your order history for full details',
                    style: TextStyle(
                      fontSize: 13,     
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 10),
        ]

        
      ),
    );
  } 
}