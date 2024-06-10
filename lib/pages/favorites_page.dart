import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/donut_provider.dart';
import '../donut_model.dart';
import '../utils/tile.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late DonutProvider donutProvider;

  @override
  void initState() {
    donutProvider = Provider.of<DonutProvider>(context, listen: false);

    loadFavorites();

    super.initState();
  }

  Future<void> loadFavorites() async {
    await donutProvider.fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<DonutProvider>(
          builder: (context, provider, child) {
            if (provider.favorites.isEmpty) {
              return const Center(child: Text('No favorites available'));
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: provider.favorites.length,
              itemBuilder: (context, index) {
                final item = provider.favorites[index];
                return Tile(
                  flavor: item.name,
                  price: item.price.toString(),
                  color: item.color ?? Colors.lightBlueAccent,
                  imageName: item.image,
                  likePressed: () {
                    // Implemente a lógica de "likePressed" para o carrinho, se necessário.
                  },
                  addToCartPressed: () {
                    donutProvider.removeFavorite(Donut(
                      name: item.name,
                      price: item.price,
                      image: item.image,
                      color: item.color,
                    ));
                  },
                  icon: Icons.remove_circle_outline,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
