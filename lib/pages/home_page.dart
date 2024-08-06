import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/burguer_tab.dart';
import '../components/donut_tab.dart';
import '../components/smoothie_tab.dart';
import '../components/tab.dart';
import '../controllers/cart_controller.dart';
import '../controllers/donut_controller.dart';
import '../donut_model.dart';
import 'cart_page.dart';
import 'favorites_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CartController cartController;
  late DonutController donutController;

  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/images/donut.png'),
    const MyTab(iconPath: "lib/images/burguer.png"),
    const MyTab(iconPath: 'lib/images/smoothie.png'),
  ];

  @override
  void didChangeDependencies() {
    cartController = Get.put(CartController());
    donutController = Get.put(DonutController());

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
              const SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Get.back();
                },
              ),
              ListTile(
                title: const Text('Favorites'),
                onTap: () {
                  Get.to(() => const FavoritesPage(),
                      transition: Transition.cupertino);
                },
              ),
              ListTile(
                title: const Text('Cart'),
                onTap: () {
                  Get.to(() => const CartPage());
                },
              ),
              // ListTile(
              //   title: const Text('Product List'),
              //   onTap: () {
              //     Get.to(() => const ProductListPage());
              //   },
              // ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const CartPage());
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey[800],
                size: 36,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.to(() => const FavoritesPage());
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
                      donutController.addFavorite(Donut(
                        name: item.name,
                        price: double.parse(item.price),
                        color: item.color,
                        image: item.image,
                      ));
                    },
                    addToCartPressed: (item) {
                      cartController.addItemToCart(item);
                      Get.showSnackbar(GetSnackBar(
                        title: 'Item added!',
                        message: 'Item: ${item.name} added to the the cart',
                        duration: const Duration(seconds: 2),
                      ));
                    },
                  ),
                  BurgerTab(
                    likePressed: (item) {
                      donutController.addFavorite(Donut(
                        name: item.name,
                        price: double.parse(item.price),
                        color: item.color,
                        image: item.image,
                      ));
                    },
                    addToCartPressed: (item) {
                      cartController.addItemToCart(item);
                      Get.showSnackbar(GetSnackBar(
                        title: 'Item added!',
                        message: 'Item: ${item.name} added to the the cart',
                        duration: const Duration(seconds: 2),
                      ));
                    },
                  ),
                  SmoothiesTab(
                    likePressed: (item) {
                      donutController.addFavorite(Donut(
                        name: item.name,
                        price: double.parse(item.price),
                        color: item.color,
                        image: item.image,
                      ));
                    },
                    addToCartPressed: (item) {
                      cartController.addItemToCart(item);
                      Get.showSnackbar(GetSnackBar(
                        title: 'Item added!',
                        message: 'Item: ${item.name} added to the the cart',
                        duration: const Duration(seconds: 2),
                      ));
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
