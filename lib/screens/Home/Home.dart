import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(10), child: AppBar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Home Screen", style: Theme.of(context).textTheme.headlineMedium),
          ],
      ),
      )
    );
  }
}