import 'package:donut_store_ui/utils/burguer_tab.dart';
import 'package:donut_store_ui/utils/pancakes_tab.dart';
import 'package:donut_store_ui/utils/pizza_tab.dart';
import 'package:donut_store_ui/utils/smoothie_tab.dart';
import 'package:donut_store_ui/utils/tab.dart';
import 'package:flutter/material.dart';

import '../utils/donut_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [

    const MyTab(iconPath: "https://www.flaticon.com/free-icons/pastry"),
    const MyTab(iconPath: "https://www.flaticon.com/free-icons/burguer" ),
    const MyTab(iconPath: "https://www.flaticon.com/free-icons/smoothie"),
    const MyTab(iconPath: "https://www.flaticon.com/free-icons/pancakes"),
    const MyTab(iconPath:"https://www.flaticon.com/free-icons/pizza"),
  ];
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(24.0),
              child: IconButton(onPressed: () { },
              icon: const Icon(Icons.menu, color: Colors.grey,size: 36,)),
            ),
          actions: [
            Icon(Icons.person, color: Colors.grey[800], size: 36,),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
              child: Row(
                children: [
                  Text('I want to eat', style: TextStyle(fontSize: 24),),
                  Text('EAT', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TabBar(tabs: myTabs),
            Expanded(child: TabBarView(children: [
                DonutTab(),
              PizzaTab(),
              PancakesTab(),
              SmoothiesTab(), BurguerTab()
            ],))
          ],
        ),
      ),
    );
  }
}