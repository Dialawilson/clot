import 'package:clot/constants/AppColor.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String profileImageUrl;

  const HomeHeader({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.profileImageUrl = 'assets/img/profile.png',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Profile Image
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFFF4F4F4),
          backgroundImage: AssetImage(profileImageUrl),
          // Fallback if image fails to load
          onBackgroundImageError: (_, __) => const Icon(Icons.account_circle),
        ),

        // Categories Dropdown
        SizedBox(
          width: 160, // Slightly wider for better text fit
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            hint: const Text(
              'Categories',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF4F4F4),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 14),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),

        // Notification Icon
        Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: AppColor.btnBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.shopping_cart_checkout_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}