import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../donut_model.dart';

class DonutController extends GetxController {
  final _favorites = <Donut>[].obs;

  get favorites => _favorites;

  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    List<dynamic> storedFavorites =
        jsonDecode(storage.read('favorites') ?? '[]');
    _favorites
        .assignAll(storedFavorites.map((e) => Donut.fromJson(e)).toList());
  }

  void addFavorite(Donut donut) {
    _favorites.add(donut);
    _saveFavoritesToStorage();
  }

  void removeFavorite(Donut donut) {
    _favorites.removeWhere((favorite) => favorite.name == donut.name);
    _saveFavoritesToStorage();
  }

  void _saveFavoritesToStorage() {
    storage.write(
        'favorites', jsonEncode(_favorites.map((e) => e.toJson()).toList()));
  }
}
