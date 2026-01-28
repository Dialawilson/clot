import 'package:flutter/material.dart';
import 'package:clot/constants/AppColor.dart';


class BottomNav extends StatelessWidget{
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.inputBg,
      selectedItemColor: AppColor.btnBackgroundColor,
      unselectedItemColor: AppColor.inputPlaceholder,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],


     );
  }
}