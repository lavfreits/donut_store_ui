import 'package:donut_store_ui/controllers/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../utils/tile.dart';

class CartPage extends StatelessWidget {
  final CartStore cartStore;
  const CartPage({
    super.key,
    required this.cartStore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) => Column(
            children: [
              Expanded(
                child: cartStore.cartItems.isEmpty
                    ? const Center(child: Text('No items in the cart'))
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.5,
                        ),
                        itemCount: cartStore.cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartStore.cartItems[index];
                          return Observer(
                            builder: (_) => Tile(
                              flavor: item.name,
                              price: item.price,
                              color: item.color,
                              imageName: item.image,
                              likePressed: () {},
                              addToCartPressed: () {
                                cartStore.removeItemFromCart(item);
                              },
                              icon: Icons.remove_circle_outline,
                            ),
                          );
                        },
                      ),
              ),
              Observer(
                builder: (_) => Text(
                  'Total: \$${cartStore.calculateTotal()}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
