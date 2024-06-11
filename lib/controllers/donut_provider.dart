import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../donut_model.dart';

part 'donut_provider.g.dart';

class DonutStore = _DonutStore with _$DonutStore;

abstract class _DonutStore with Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @observable
  List<Donut> _favorites = ObservableList<Donut>();

  @computed
  List<Donut> get favorites => _favorites;

  @action
  Future<void> fetchFavorites() async {
    try {
      final snapshot = await _firestore.collection('favorites').get();
      _favorites =
          snapshot.docs.map((doc) => Donut.fromFirestore(doc.data())).toList();
    } catch (error) {
      print('Error fetching favorites: $error');
    }
  }

  @action
  void saveFavorites(List<Donut> favorites) {
    for (var donut in favorites) {
      _firestore
          .collection('favorites')
          .doc(donut.name)
          .set(donut.toFirestore());
    }
    fetchFavorites();
  }

  @action
  void addFavorite(Donut donut) {
    _favorites.add(donut);

    _firestore.collection('favorites').doc(donut.name).set(donut.toFirestore());
    saveFavorites(_favorites);
  }

  @action
  void removeFavorite(Donut donut) {
    _favorites.removeWhere((favorite) => favorite.name == donut.name);

    _firestore.collection('favorites').doc(donut.name).delete();
    saveFavorites(_favorites);
  }
}
