import 'package:flutter/material.dart';
import 'tile.dart';

class BurguerTab extends StatelessWidget {
  BurguerTab({super.key});

  List burgersOnSale = [
    [
      'Classic Burger',
      '10.99',
      Colors.brown,
      'lib/images/burguerr.png',
    ],
    [
      'Cheeseburger',
      '12.99',
      Colors.yellow,
      'lib/images/hamburger.png',
    ],
    [
      'Bacon Burger',
      '14.99',
      Colors.red,
      'lib/images/fast-food.png',
    ],
    [
      'Veggie Burger',
      '11.99',
      Colors.green,
      'lib/images/veggie.png',
    ],

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: burgersOnSale.length ,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (_, index) {
        return Center(
          child: Tile(
            flavor: burgersOnSale[index][0],
            price: burgersOnSale[index][1],
            color: burgersOnSale[index][2],
            imageName: burgersOnSale[index][3],
          ),
        );
      },
    );
  }
}
