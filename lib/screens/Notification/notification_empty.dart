import 'package:clot/constants/AppColor.dart';
import 'package:clot/screens/Home/Cate_Result.dart';
import 'package:clot/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyNotification extends StatefulWidget{
  const EmptyNotification({super.key});

  @override
  State<EmptyNotification> createState() => _EmptyNotificationState();
}

class _EmptyNotificationState extends State<EmptyNotification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Image.asset('assets/img/bell.png', height: 100, width: 100,  ),
          SizedBox(height: 20), 
          Text('No Notification Yet', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 20),
          Text('You’re all caught up. Check back later for new updates!', style: TextStyle(color: AppColor.inputPlaceholder),),
          SizedBox(height: 20),
          SizedBox(width: 250,
            child: Btn(onPressed: (){
              Navigator.pop(context, 
              MaterialPageRoute(builder: (context) => const CateResult()));
            
            }, text: 'Explore Categories'),
          )
        ],
      ),
    );
  } 
}