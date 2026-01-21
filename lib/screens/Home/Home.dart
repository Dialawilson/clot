import 'package:clot/constants/AppColor.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/img/profile.png', width: 40, height: 40, errorBuilder: (context, error, stackTrace) => const Icon(Icons.account_circle, size: 40)),
                  
                  // Wrap Dropdown in a Container or SizedBox to control width
                  SizedBox(
                    width: 150,
                    child: DropdownButtonFormField<String>(
                      value: selectedValue,
                      hint: const Text('Categories'),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF4F4F4),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: items.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                    ),
                  ),
                  const Icon(Icons.notifications_none, color: Colors.black,  size: 30),
                ],
              ),
              
              const SizedBox(height: 20),
              Text(
                "Home Screen",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textColor,
                ),
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