class Item {
  final String name;
  final String unit;
  final int price;
  final String image;

  Item({required this.name, required this.unit, required this.price, required this.image});

  Map toJson() {
    return {
      'Nom': name,
      'Quantité': unit,
      'Prix': price,
      'image': image,
    };
  }
}
