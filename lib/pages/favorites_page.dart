import 'package:donut_store_ui/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/tile.dart';
import '../controllers/donut_controller.dart';
import '../donut_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late DonutController donutController;
  late CartController cartController;

  @override
  void initState() {
    donutController = Get.find<DonutController>();
    cartController = Get.find<CartController>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () {
            if (donutController.favorites.isEmpty) {
              return const Center(child: Text('No favorites available'));
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: donutController.favorites.length,
              itemBuilder: (context, index) {
                final item = donutController.favorites[index];
                return Center(
                  child: Tile(
                    flavor: item.name,
                    price: item.price.toString(),
                    color: item.color ?? Colors.lightBlueAccent,
                    imageName: item.image,
                    likePressed: () {
                      donutController.removeFavorite(Donut(
                        name: item.name,
                        price: item.price,
                        image: item.image,
                        color: item.color,
                      ));
                    },
                    addToCartPressed: () {
                      donutController.removeFavorite(Donut(
                        name: item.name,
                        price: item.price,
                        image: item.image,
                        color: item.color,
                      ));
                    },
                    icon: Icons.remove_circle_outline,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
