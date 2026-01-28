import 'package:clot/constants/AppColor.dart';
import 'package:clot/screens/Home/Home.dart';
import 'package:flutter/material.dart';

class CategoriesPage  extends StatefulWidget{
  const CategoriesPage ({super.key});

  @override
  State<CategoriesPage> createState()=> _CategoriesPage();
}

class _CategoriesPage extends State<CategoriesPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
        }, icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColor.textColor,)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text('Shop by Categories', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ))
            ],
          ),
        )),
    ); 
  }
}