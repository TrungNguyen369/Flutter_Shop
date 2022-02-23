class Cart {
  late String idProduct;
  late String nameProduct;
  late int   costProduct;
  late String imageProduct;
  late int newCost;
  late int quantityProduct;
  Cart(
      {required this.idProduct, required this.nameProduct, required this.costProduct, required this.imageProduct, required this.quantityProduct, required this.newCost});

  static late List<Cart> cartList = [];
}