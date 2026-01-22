import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        // prefixIcon places the icon inside the field on the left
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black87,
          size: 24,
        ),
        filled: true,
        fillColor: const Color(0xFFF4F4F4),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none, // Removes the default underline/border
        ),
      ),
      
    );
  }
}