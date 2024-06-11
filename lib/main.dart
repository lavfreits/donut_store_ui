import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donut_store_ui/controllers/donut_provider.dart';
import 'package:donut_store_ui/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/cart_store.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  firestore.collection('favorites').snapshots().listen((event) {
    print('Favorites: ${event.docs}');
  });

  firestore.settings = const Settings(persistenceEnabled: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => DonutStore()),
        Provider(create: (context) => CartStore()),
      ],
      child: MaterialApp(
        title: 'Donut Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
