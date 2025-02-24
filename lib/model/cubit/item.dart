class Item {
  final String id;

  final String name;
  final String price;
  final String imageUrl;
  final String? number;
  final String? time;
  final String? ingredients;

  Item({
    required this.id,
    required this.number,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.time,
    required this.ingredients,
  });

  Map<String, dynamic> toJson() {
    return {
      'ingredients': ingredients,

      'time': time,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'number': number,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      ingredients: json['ingredients'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      number: json['number'],
      price: json['price'],
      time: json['time'],
    );
  }

}
