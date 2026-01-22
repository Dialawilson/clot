import 'package:clot/constants/AppColor.dart';
import 'package:clot/widgets/dropdown.dart';
import 'package:clot/widgets/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variables must be inside the State class
  String? selectedValue;
  final List<String> items = ['Men', 'Women', 'Kids'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Using toolbarHeight directly is cleaner than PreferredSize
        toolbarHeight: 70, 
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Center(
          child: const Text(
            'Clot',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             HomeHeader(
    selectedValue: selectedValue,
    items: items,
    onChanged: (newValue) {
      setState(() {
        selectedValue = newValue;
      });
    },
  ),
              
              const SizedBox(height: 20),
              Search(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColor,
                    ),
                  ),

                  TextButton(onPressed: (){
                    // Action for "See All" button
                  }, child: Text("See All", style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.btnBackgroundColor,
                  ),))
                ],
              ),
              const SizedBox(height: 20),
              
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.btnBackgroundColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text("Promo Banner or Category")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}