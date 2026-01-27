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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section
              HomeHeader(
                selectedValue: selectedValue,
                items: items,
                onChanged: (newValue) {
                  setState(() => selectedValue = newValue);
                },
              ),
              const SizedBox(height: 20),
              
              // 2. Search Section
              const Search(),
              const SizedBox(height: 20),
              
              // 3. Categories Section
              _buildSectionHeader("Categories", () {}),
              const SizedBox(height: 15),
              
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
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
              
              // 4. Top Selling Section
              _buildSectionHeader("Top Selling", () {}),
              const SizedBox(height: 20),

              // FIXED: Removed the extra SingleChildScrollView. ListView.builder handles it.
              SizedBox(
                height: 285, // Fixed height for the sliding area
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  // AlwaysScrollable ensures the swipe gesture is captured over the parent scroll
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SizedBox(
                        width: 160, // Fixed width for each card
                        child: ProductCard(
                          imgUrl: 'assets/img/jacket.png',
                          title: 'Men\'s Harrington Jacket',
                          description: 'Classic fit outwear',
                          price: '\$148',
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),
              
              
              // 5. Promo Banner Section
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.btnBackgroundColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text("Promo Banner or Category")),
              ),
              const SizedBox(height: 30), 
            ],
          ),
        ),
      ),
    );
  }

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