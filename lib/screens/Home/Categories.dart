import 'package:flutter/material.dart';
import 'package:clot/constants/AppColor.dart';
import 'package:clot/screens/Home/Home.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // A helper list to keep the UI code clean
  final List<Map<String, String>> categories = [
    {'name': 'Hoodies', 'img': 'assets/img/hoodie.png'},
    {'name': 'Accessories', 'img': 'assets/img/Accessories.png'},
    {'name': 'Shorts', 'img': 'assets/img/shorts.png'},
    {'name': 'Shoes', 'img': 'assets/img/shoe.png'},
    {'name': 'Bags', 'img': 'assets/img/bag.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Using Navigator.pop is better than push for a "back" button
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColor.textColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Shop by Categories',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              
              // We use Expanded and ListView so the list is scrollable
              Expanded(
                child: ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return _buildCategoryItem(
                      categories[index]['name']!,
                      categories[index]['img']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A custom widget for the category row
  Widget _buildCategoryItem(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigate to specific category search results
      },
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4), // Clot's signature light grey
          borderRadius: BorderRadius.circular(1),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
          //   const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
          //
          ],
        ),
      ),
    );
  }
}