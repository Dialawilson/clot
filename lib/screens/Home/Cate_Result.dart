import 'package:clot/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CateResult extends StatelessWidget {
  const CateResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        // Using Navigator.pop is cleaner for 'back' actions
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        ),
        title: const Text(
          'Clot',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Header Text
            const Text(
              'Hoodies (24)',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 25),
            
            // Expanded is the FIX for the 'Render Box' error. 
            // It gives the GridView a specific boundary to draw in.
            Expanded(
              child: GridView.builder(
                itemCount: 10, // Replace with your list length
                // BouncingScrollPhysics gives that premium iOS feel
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,          // Exactly 2 items per row
                  childAspectRatio: 0.62,     // Height-to-width ratio for cards
                  crossAxisSpacing: 15,       // Horizontal gap
                  mainAxisSpacing: 15,        // Vertical gap
                ),
                itemBuilder: (context, index) {
                  return const ProductCard(
                    imgUrl: 'assets/img/jacket.png',
                    title: 'Men\'s Harrington Jacket',
                    description: 'Classic fit outwear',
                    price: '\$148',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}