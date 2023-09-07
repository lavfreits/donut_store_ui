import 'package:flutter/material.dart';
import 'tile.dart';

class SmoothiesTab extends StatelessWidget {
  SmoothiesTab({super.key});

  List smoothiesInSale = [
    [
      'Berry Bliss Smoothie',
      '32',
      Colors.purple,
      'lib/images/smoothiee.png',
    ],
    [
      'Tropical Paradise Smoothie',
      '28',
      Colors.orange,
      'lib/images/fruit-juice.png',
    ],
    [
      'Green Machine Smoothie',
      '30',
      Colors.green,
      'lib/images/smoothie (2).png',
    ],
    [
      'Strawberry Delight Smoothie',
      '34',
      Colors.red,
      'lib/images/smoothie (1).png',
    ],

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: smoothiesInSale.length ,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (_, index) {
        return Center(
          child: Tile(
            flavor: smoothiesInSale[index][0],
            price: smoothiesInSale[index][1],
            color: smoothiesInSale[index][2],
            imageName: smoothiesInSale[index][3],
          ),
        );
      },
    );
  }
}
