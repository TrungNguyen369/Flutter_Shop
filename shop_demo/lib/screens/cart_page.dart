import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_demo/model/cart.dart';
import 'package:shop_demo/model/customer.dart';
import 'package:shop_demo/screens/login_page.dart';
import 'package:shop_demo/screens/order_page.dart';
import 'package:shop_demo/screens/home.dart';

class CartPage extends StatefulWidget {
  final Cart? cart;

  const CartPage({required this.cart, Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalCost = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < Cart.cartList.length; i++) {
      totalCost += Cart.cartList[i].newCost;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giỏ Hàng"),
      ),
      body: Cart.cartList.length == 0
          ?  Center(
              child: Text(
                "Giỏ hàng trống",
                style: TextStyle(fontSize: 32),
              ),
            )
          : Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.lightBlue.shade100
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
              child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: ListView.builder(
                      itemCount: Cart.cartList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                      child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Hero(
                                      tag:
                                          "${Cart.cartList[index].nameProduct}",
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'images/no_image.jpg',
                                        image:
                                            Cart.cartList[index].imageProduct,
                                        width: 150,
                                        height: 150,
                                      ),
                                    ),
                                  )),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Số lượng:"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      // Minus Quantity
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            Cart.cartList[index]
                                                                .quantityProduct--;
                                                            Cart.cartList[index]
                                                                .newCost = Cart.cartList[
                                                                        index]
                                                                    .costProduct *
                                                                Cart.cartList[
                                                                        index]
                                                                    .quantityProduct;
                                                            if (Cart.cartList[
                                                                        index]
                                                                    .quantityProduct <=
                                                                0) {
                                                              Cart.cartList[
                                                                      index]
                                                                  .quantityProduct = 0;
                                                              Cart.cartList[
                                                                      index]
                                                                  .newCost = 0;
                                                              showDialog<
                                                                      String>(
                                                                  context:
                                                                      context,
                                                                  builder: (BuildContext
                                                                          context) =>
                                                                      AlertDialog(
                                                                        title: const Text(
                                                                            'AlertDialog Title'),
                                                                        content:
                                                                            const Text('Bạn muốn xóa sản phẩm ra khỏi giỏ hàng'),
                                                                        actions: <
                                                                            Widget>[
                                                                          TextButton(
                                                                            onPressed: () {
                                                                              setState(() {

                                                                              });
                                                                                Navigator.pop(context, 'Cancel');},
                                                                            child:
                                                                                const Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Cart.cartList.removeAt(index);
                                                                              Navigator.pop(context, 'ok');
                                                                              setState(() {
                                                                                Cart.cartList.length;
                                                                                totalCost = 0;
                                                                                for (int i = 0; i < Cart.cartList.length; i++) {
                                                                                  totalCost += Cart.cartList[i].newCost;
                                                                                }
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text('OK'),
                                                                          ),
                                                                        ],
                                                                      ));
                                                            }
                                                            setState(() {
                                                              Cart.cartList[
                                                                      index]
                                                                  .quantityProduct;
                                                              Cart.cartList[
                                                                      index]
                                                                  .newCost;
                                                              totalCost = 0;
                                                              for (int i = 0;
                                                                  i <
                                                                      Cart.cartList
                                                                          .length;
                                                                  i++) {
                                                                totalCost +=
                                                                    Cart.cartList[
                                                                            i]
                                                                        .newCost;
                                                              }
                                                            });
                                                          },
                                                          child: const Text(
                                                            "-",
                                                            style: TextStyle(
                                                                fontSize: 32),
                                                          )),
                                                    ),
                                                    Container(
                                                      color:
                                                          Colors.grey.shade200,
                                                      width: 50,
                                                      height: 50,
                                                      child: Center(
                                                          child: Text(
                                                        "${Cart.cartList[index].quantityProduct}",
                                                      )),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      // Add Quantity
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            Cart.cartList[index]
                                                                .quantityProduct++;
                                                            Cart.cartList[index]
                                                                .newCost = Cart.cartList[
                                                                        index]
                                                                    .costProduct *
                                                                Cart.cartList[
                                                                        index]
                                                                    .quantityProduct;
                                                            totalCost = 0;
                                                            setState(() {
                                                              Cart.cartList[
                                                                      index]
                                                                  .quantityProduct;
                                                              Cart.cartList[
                                                                      index]
                                                                  .newCost;
                                                              for (int i = 0;
                                                                  i <
                                                                      Cart.cartList
                                                                          .length;
                                                                  i++) {
                                                                totalCost +=
                                                                    Cart.cartList[
                                                                            i]
                                                                        .newCost;
                                                              }
                                                            });
                                                          },
                                                          child: const Text(
                                                            "+",
                                                            style: TextStyle(
                                                                fontSize: 32),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Giá sản phẩm:  ${NumberFormat("###,###,###", "en_US").format(Cart.cartList[index].newCost)} đ",
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      "Tổng giỏ hàng:  ${NumberFormat("###,###,###", "en_US").format(totalCost)}",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: const Text(
                              "Tiếp tục mua hàng",
                            )),
                        ElevatedButton(
                            onPressed: () {
                              if ( Customer.exsist == false) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrderPage()),
                                );
                              }
                            },
                            child: const Text(
                              "Thanh Toán Giỏ Hàng",
                            )),
                      ],
                    ))
              ],
            )),
    );
  }
}
