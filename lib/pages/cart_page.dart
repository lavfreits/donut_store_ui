import 'package:donut_store_ui/controllers/cart_model.dart';
import 'package:flutter/material.dart';

import '../utils/tile.dart'; // Certifique-se de importar o arquivo Tile ou o widget Tile que você está usando nas guias.

class CartPage extends StatelessWidget {
  final CartModel cartModel;
  const CartPage({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: cartModel.cartItems.isEmpty
                  ? const Center(child: Text('No items in the cart'))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.5,
                      ),
                      itemCount: cartModel.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartModel.cartItems[index];
                        return Tile(
                          flavor: item.name,
                          price: item.price,
                          color: item.color,
                          imageName: item.image,
                          likePressed: () {
                            cartModel.addItemToCart(item);
                          },
                          addToCartPressed: () {
                            cartModel.removeItemFromCart(item);
                          },
                          icon: Icons.remove_circle_outline,
                        );
                      },
                    ),
            ),
            Text(
              'Total: \$${cartModel.calculateTotal()}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
