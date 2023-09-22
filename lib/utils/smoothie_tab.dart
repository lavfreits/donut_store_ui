import 'package:donut_store_ui/utils/tile.dart';
import 'package:flutter/material.dart';
import '../controllers/item_model.dart'; // Certifique-se de importar a classe Item

class SmoothiesTab extends StatelessWidget {
  final void Function(Item) likePressed;
  final void Function(Item) addToCartPressed;

  SmoothiesTab({
    super.key,
    required this.likePressed,
    required this.addToCartPressed,
  });

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
      itemCount: smoothiesInSale.length,
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
      name: smoothiesInSale[index][0],
      price: smoothiesInSale[index][1],
      color: smoothiesInSale[index][2],
      image: smoothiesInSale[index][3],
      category: 'Smoothies',
    );
    return item;
  }
}
