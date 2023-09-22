import 'package:donut_store_ui/utils/tile.dart';
import 'package:flutter/material.dart';
import '../controllers/item_model.dart'; // Certifique-se de importar a classe Item

class BurgerTab extends StatelessWidget {
  final void Function(Item) likePressed;
  final void Function(Item) addToCartPressed;

  BurgerTab({
    super.key,
    required this.likePressed,
    required this.addToCartPressed,
  });

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
      itemCount: burgersOnSale.length,
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
      name: burgersOnSale[index][0],
      price: burgersOnSale[index][1],
      color: burgersOnSale[index][2],
      image: burgersOnSale[index][3],
      category: 'Burgers',
    );
    return item;
  }
}
