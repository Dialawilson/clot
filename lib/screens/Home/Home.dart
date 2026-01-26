import 'package:clot/constants/AppColor.dart';
import 'package:clot/widgets/categories.dart';
import 'package:clot/widgets/dropdown.dart';
import 'package:clot/widgets/product_card.dart';
import 'package:clot/widgets/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedValue;
  final List<String> items = ['Men', 'Women', 'Kids'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        leading: const Icon(Icons.menu, color: Colors.black),
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
      body: SingleChildScrollView(
        // Added BouncingScrollPhysics for a more premium "iOS" feel
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                selectedValue: selectedValue,
                items: items,
                onChanged: (newValue) {
                  setState(() => selectedValue = newValue);
                },
              ),
              const SizedBox(height: 20),
              const Search(),
              const SizedBox(height: 20),
              
              // Categories Section
              _buildSectionHeader("Categories", () {}),
              const SizedBox(height: 15),
              
              // Using a SingleChildScrollView (Horizontal) for Categories
              // This prevents "Pixel Overflow" if you add more categories later
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Categories(imgPath: 'assets/img/profile.png', title: 'Hoodies', pageLink: const Home()),
                    const SizedBox(width: 20),
                    Categories(imgPath: 'assets/img/profile.png', title: 'Shorts', pageLink: const Home()),
                    const SizedBox(width: 20),
                    Categories(imgPath: 'assets/img/profile.png', title: 'Shoes', pageLink: const Home()),
                    const SizedBox(width: 20),
                    Categories(imgPath: 'assets/img/profile.png', title: 'Bag', pageLink: const Home()),
                    const SizedBox(width: 20),
                    Categories(imgPath: 'assets/img/profile.png', title: 'Accessory', pageLink: const Home()),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              _buildSectionHeader("Top Selling", () {}),
              const SizedBox(height: 20),

              // FIX: GridView inside SingleChildScrollView
              GridView.builder(
                shrinkWrap: true, // 1. Tells Grid to take only needed space
                physics: const NeverScrollableScrollPhysics(), // 2. Disables inner scrolling
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.62, // Adjusted to fit image + title + price
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 4, // Set a smaller number for testing
                itemBuilder: (context, index) => const ProductCard(
                  imgUrl: 'assets/img/jacket.png',
                  title: 'Men\'s Harrington Jacket',
                  description: 'Classic fit outwear',
                  price: '\$148',
                ),
              ),

              const SizedBox(height: 25),
              
              // Promo Banner
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.btnBackgroundColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text("Promo Banner or Category")),
              ),
              const SizedBox(height: 30), // Padding at the bottom
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to keep code clean
  Widget _buildSectionHeader(String title, VoidCallback onSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onSeeAll,
          child: Text(
            "See All",
            style: TextStyle(color: AppColor.btnBackgroundColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}