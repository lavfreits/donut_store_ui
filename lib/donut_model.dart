import 'dart:ui';

class Donut {
  final String name;
  final double price;
  Color? color;
  final String image;

  Donut({
    required this.name,
    required this.price,
    this.color,
    required this.image,
  });

  factory Donut.fromFirestore(Map<String, dynamic> data) {
    return Donut(
      name: data['name'],
      price: data['price'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'price': price,
      'color': color?.value.toString() ?? "",
      'image': image,
    };
  }
}
