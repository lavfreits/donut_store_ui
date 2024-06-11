import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controllers/donut_provider.dart';
import '../donut_model.dart';
import '../utils/tile.dart';

class FavoritesPage extends StatefulWidget {
  final DonutStore donutStore;
  const FavoritesPage({
    Key? key,
    required this.donutStore,
  }) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    loadFavorites();

    super.initState();
  }

  Future<void> loadFavorites() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (context) {
            if (widget.donutStore.favorites.isEmpty) {
              return const Center(child: Text('No favorites available'));
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: widget.donutStore.favorites.length,
              itemBuilder: (context, index) {
                final item = widget.donutStore.favorites[index];
                return Tile(
                  flavor: item.name,
                  price: item.price.toString(),
                  color: item.color ?? Colors.lightBlueAccent,
                  imageName: item.image,
                  likePressed: () {},
                  addToCartPressed: () {
                    widget.donutStore.removeFavorite(Donut(
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
