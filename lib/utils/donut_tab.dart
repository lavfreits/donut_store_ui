import 'package:flutter/material.dart';
import 'tile.dart';

class DonutTab extends StatelessWidget {
  DonutTab({super.key});

  List donutsOnSale = [
    [
      'IceCream',
      '36',
      Colors.blue,
      'lib/images/donut (1).png',
    ],
    [
      'Sugar Donut',
      '24',
      Colors.pink,
      'lib/images/donut (2).png',
    ],
    [
      'Chocolate Donut',
      '18',
      Colors.brown,
      'lib/images/donutt.png',
    ],
    [
      'Glazed Donut',
      '22',
      Colors.yellow,
      'lib/images/donut (3).png',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutsOnSale.length,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (_, index) {
        return Center(
          child: Tile(
            flavor: donutsOnSale[index][0],
            price: donutsOnSale[index][1],
            color: donutsOnSale[index][2],
            imageName: donutsOnSale[index][3],
          ),
        );
      },
    );
  }
}
