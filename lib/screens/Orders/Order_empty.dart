import 'package:flutter/material.dart';
import 'package:clot/screens/Home/Home.dart';
import 'package:clot/widgets/btn.dart';
import 'package:clot/constants/AppColor.dart';

class OrderEmpty extends StatefulWidget {
  const OrderEmpty({Key? key}) : super(key: key);

  @override
  State<OrderEmpty> createState() => _OrderEmptyState();
}

class _OrderEmptyState extends State<OrderEmpty> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 100, child: Image.asset('assets/img/bell.png', height: 100, width: 100,  )),
          SizedBox(height: 20), 
          Text('No Orders Yet', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 20),
          Text('You’re all caught up. Check back later for new updates!', style: TextStyle(color: AppColor.inputPlaceholder),),
          SizedBox(height: 20),
          SizedBox(width: 250,
            child: Btn(onPressed: (){
              Navigator.pop(context, 
              MaterialPageRoute(builder: (context) => const Home()));
            
            }, text: 'Explore Categories'),
          )
        ],
      ),
    );
  }
} 