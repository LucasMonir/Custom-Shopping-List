class Item {
  late int id;
  late double price;
  late String name;

  Item({name, price, id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
