import 'package:clot/screens/Orders/Orders_page.dart';
import 'package:flutter/material.dart';
import 'package:clot/constants/AppColor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clot/screens/Home/Home.dart';
import 'package:clot/screens/Notification/notification_page.dart';
// import 'package:clot/screens/Profile/profile_page.dart';
// import 'package:clot/screens/Settings/settings_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // 1. Create a variable to track the current index
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if(index == 0){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
    }
    if(index == 1){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
    }
    if(index == 2){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersPage()));
    }
    // if(index == 3){
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex, // 2. Tell the bar which index is active
      onTap: _onItemTapped,     
      // 3. Update the index when clicked
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.inputBg,
      selectedItemColor: AppColor.btnBackgroundColor,
      unselectedItemColor: AppColor.inputPlaceholder,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _buildNavItem('assets/svg/Vector.svg', 'Home', 0),
        _buildNavItem('assets/svg/alert.svg', 'Notification', 1),
        _buildNavItem('assets/svg/detail.svg', 'Settings', 2),
        _buildNavItem('assets/svg/profile.svg', 'Profile', 3),
      ],
    );
  }

  // Helper method to apply color logic to SVGs
  BottomNavigationBarItem _buildNavItem(String assetPath, String label, int index) {
    final isSelected = _selectedIndex == index;
    
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        assetPath,
        // 4. This is the magic: It tints the SVG with the correct color
        colorFilter: ColorFilter.mode(
          isSelected ? AppColor.btnBackgroundColor : AppColor.inputPlaceholder,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}