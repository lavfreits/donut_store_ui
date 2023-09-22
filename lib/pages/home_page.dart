import 'package:donut_store_ui/pages/favorites_page.dart';
import 'package:donut_store_ui/utils/burguer_tab.dart';
import 'package:donut_store_ui/utils/smoothie_tab.dart';
import 'package:donut_store_ui/utils/tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/cart_model.dart';
import '../controllers/favorites_model.dart';
import '../utils/donut_tab.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CartModel cartModel;
  late LikedModel likedModel;
  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/images/donut.png'),
    const MyTab(iconPath: "lib/images/burguer.png"),
    const MyTab(iconPath: 'lib/images/smoothie.png'),
  ];

  // @override
  // void initState() {
  //   cartModel = Provider.of<CartModel>(context);
  //   likedModel = Provider.of<LikedModel>(context);
  //   super.initState();
  // }
  @override
  void didChangeDependencies() {
    cartModel = Provider.of<CartModel>(context);
    likedModel = Provider.of<LikedModel>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.grey,
                size: 36,
              ),
            ),
          ),
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
                    builder: (context) => FavoritesPage(likedModel: likedModel),
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
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                      likedModel.addItemToLiked(item);
                    },
                    addToCartPressed: (item) {
                      cartModel.addItemToCart(item);
                    },
                  ),
                  BurgerTab(
                    likePressed: (item) {
                      likedModel.addItemToLiked(item);
                    },
                    addToCartPressed: (item) {
                      cartModel.addItemToCart(item);
                    },
                  ),
                  SmoothiesTab(
                    likePressed: (item) {
                      likedModel.addItemToLiked(item);
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
