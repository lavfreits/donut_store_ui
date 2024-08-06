import 'package:donut_store_ui/controllers/cart_controller.dart';
import 'package:donut_store_ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/tile.dart';
import '../controllers/donut_controller.dart';
import '../donut_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final CartController cartModel;
  late final DonutController donutController;

  @override
  void initState() {
    super.initState();

    cartModel = Get.find<CartController>();
    donutController = Get.find<DonutController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
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
                              donutController.addFavorite(Donut(
                                name: item.name,
                                price: double.parse(item.price),
                                color: item.color,
                                image: item.image,
                              ));
                            },
                            addToCartPressed: () {
                              cartModel.removeItemFromCart(item);
                              Get.showSnackbar(GetSnackBar(
                                title: 'Item removed!',
                                message:
                                    'Item: ${item.name} removed from the the cart',
                                duration: const Duration(seconds: 2),
                              ));
                            },
                            icon: Icons.remove_circle_outline,
                          );
                        },
                      ),
              ),
              Text(
                'Total: \$${cartModel.totalPrice.toStringAsFixed(2).obs}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(() => const HomePage());
                },
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
