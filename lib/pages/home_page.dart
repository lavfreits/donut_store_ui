import 'package:donut_store_ui/pages/favorites_page.dart';
import 'package:donut_store_ui/utils/burguer_tab.dart';
import 'package:donut_store_ui/utils/smoothie_tab.dart';
import 'package:donut_store_ui/utils/tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/cart_model.dart';
import '../controllers/donut_provider.dart';
import '../donut_model.dart';
import '../utils/donut_tab.dart';
import 'cart_page.dart';
import 'product_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CartModel cartModel;
  // late LikedModel likedModel;
  late DonutProvider donutProvider;

  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/images/donut.png'),
    const MyTab(iconPath: "lib/images/burguer.png"),
    const MyTab(iconPath: 'lib/images/smoothie.png'),
  ];

  @override
  void didChangeDependencies() {
    cartModel = Provider.of<CartModel>(context);
    // likedModel = Provider.of<LikedModel>(context);
    donutProvider = Provider.of<DonutProvider>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Favorites'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FavoritesPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Cart'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        cartModel: cartModel,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Product List'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProductListPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartPage(
                      cartModel: cartModel,
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey[800],
                size: 36,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FavoritesPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.grey[800],
                size: 36,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 20),
              child: Row(
                children: [
                  Text(
                    'I want to eat ',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    '...',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TabBar(tabs: myTabs),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(
                    likePressed: (item) {
                      donutProvider.addFavorite(Donut(
                        name: item.name,
                        price: double.parse(item.price),
                        color: item.color,
                        image: item.image,
                      ));
                    },
                    addToCartPressed: (item) {
                      cartModel.addItemToCart(item);
                    },
                  ),
                  BurgerTab(
                    likePressed: (item) {
                      donutProvider.addFavorite(Donut(
                        name: item.name,
                        price: double.parse(item.price),
                        color: item.color,
                        image: item.image,
                      ));
                    },
                    addToCartPressed: (item) {
                      cartModel.addItemToCart(item);
                    },
                  ),
                  SmoothiesTab(
                    likePressed: (item) {
                      donutProvider.addFavorite(Donut(
                        name: item.name,
                        price: double.parse(item.price),
                        color: item.color,
                        image: item.image,
                      ));
                    },
                    addToCartPressed: (item) {
                      cartModel.addItemToCart(item);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
