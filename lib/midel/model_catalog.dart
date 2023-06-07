import 'dart:convert';

class CatalogModel {
  static List<Item> items = []; // Initialize items as an empty list
}

class Item {
  final int id;
  final String name;
  final String dec;
  final String price;
  final String colors;
  final String image;

//<editor-fold desc="Data Methods">
  const Item({
    required this.id,
    required this.name,
    required this.dec,
    required this.price,
    required this.colors,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          dec == other.dec &&
          price == other.price &&
          colors == other.colors &&
          image == other.image);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      dec.hashCode ^
      price.hashCode ^
      colors.hashCode ^
      image.hashCode;

  @override
  String toString() {
    return 'Item{' +
        ' id: $id,' +
        ' name: $name,' +
        ' dec: $dec,' +
        ' price: $price,' +
        ' colors: $colors,' +
        ' image: $image,' +
        '}';
  }

  Item copyWith({
    int? id,
    String? name,
    String? dec,
    String? price,
    String? colors,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      dec: dec ?? this.dec,
      price: price ?? this.price,
      colors: colors ?? this.colors,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'dec': this.dec,
      'price': this.price,
      'colors': this.colors,
      'image': this.image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      dec: map['dec'] as String,
      price: map['price'] as String,
      colors: map['colors'] as String,
      image: map['image'] as String,
    );
  }

//</editor-fold>
}
