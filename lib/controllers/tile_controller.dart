import 'package:get/get.dart';

class TileController extends GetxController {
  final _isLiked = false.obs;

  bool get isLiked => _isLiked.value;

  void toggleLike() {
    _isLiked.value = !_isLiked.value;
  }
}
