class Item {
  final String name;
  final String price;
  final color;
  final String image;
  final String category;

  Item({
    required this.color,
    required this.image,
    required this.name,
    required this.price,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      color: json['color'],
      image: json['image'],
      name: json['name'],
      price: json['price'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'image': image,
      'name': name,
      'price': price,
      'category': category,
    };
  }
}
