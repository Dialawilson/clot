import 'package:clot/constants/AppColor.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String imgPath;
  final String title;
  final Widget pageLink; // Explicitly typed as Widget

  const Categories({
    super.key,
    required this.imgPath,
    required this.title,
    required this.pageLink,
  });

  // Fixed the parameter name from BuildContext (type) to context (variable)
  void _navigate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => pageLink),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigate(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Elegant Circular Image Container
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: Color(0xFFF4F4F4), // Light background to make icons pop
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
                // Helpful error handling for missing assets
                errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.category_outlined, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}