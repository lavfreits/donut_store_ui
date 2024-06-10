import 'package:flutter/material.dart';

import '../controllers/item_model.dart';
import 'tile.dart';

class DonutTab extends StatelessWidget {
  final void Function(Item) likePressed;
  final void Function(Item) addToCartPressed;

  DonutTab({
    super.key,
    required this.likePressed,
    required this.addToCartPressed,
  });

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
            likePressed: () {
              Item item = add(index);
              likePressed(item);
            },
            addToCartPressed: () {
              Item item = add(index);
              addToCartPressed(item);
            },
            icon: Icons.add,
          ),
        );
      },
    );
  }

  Item add(int index) {
    Item item = Item(
      name: donutsOnSale[index][0],
      price: donutsOnSale[index][1],
      color: donutsOnSale[index][2],
      image: donutsOnSale[index][3],
      category: 'Donuts',
    );
    return item;
  }
}
