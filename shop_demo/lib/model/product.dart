class Product {
  late String id;
  late String name;
  late String price;
  late String image;
  late String description;
  late String idcategory;

  Product(
      {required this.id,
        required this.name,
        required this.price,
        required this.image,
        required this.description,
        required this.idcategory});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    idcategory = json['idcategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    data['idcategory'] = this.idcategory;
    return data;
  }
}

