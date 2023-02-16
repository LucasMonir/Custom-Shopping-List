class Item {
  int? id;
  final double price;
  final String name;

  Item({this.id, required this.price, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
