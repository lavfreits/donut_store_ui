import 'package:flutter/material.dart';

import '../controllers/favorites_model.dart';
import '../utils/tile.dart';

class FavoritesPage extends StatelessWidget {
  final LikedModel likedModel;

  const FavoritesPage({
    super.key,
    required this.likedModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: likedModel.likedItems.length,
                itemBuilder: (context, index) {
                  final item = likedModel.likedItems[index];
                  return Tile(
                    flavor: item.name,
                    price: item.price,
                    color: item.color,
                    imageName: item.image,
                    likePressed: () {
                      // Implemente a lógica de "likePressed" para o carrinho, se necessário.
                    },
                    addToCartPressed: () {
                      // Implemente a lógica de "addToCartPressed" para o carrinho, se necessário.
                    },
                    icon: Icons.remove_circle_outline,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
