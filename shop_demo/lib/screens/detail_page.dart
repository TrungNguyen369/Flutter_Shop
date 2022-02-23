import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_demo/model/cart.dart';
import 'package:shop_demo/model/product.dart';

import 'cart_page.dart';

class GirdDetails extends StatefulWidget {
  final Product? product;

  const GirdDetails({this.product});

  @override
  _GirdDetailsState createState() => _GirdDetailsState();
}

class _GirdDetailsState extends State<GirdDetails> {

  int _counter = 1;
  int NewCost = 0;

  void AddQuantity() {
    setState(() {
      _counter++;
      NewCost = int.parse(widget.product!.price) * _counter;
      if (_counter >= 10) {
        _counter = 10;
      }
    });
  }

  void MinusQuantity() {
    setState(() {
      _counter--;
      NewCost = int.parse(widget.product!.price) * _counter;
      if (_counter <= 1) {
        _counter = 1;
        NewCost = int.parse(widget.product!.price);
      }
    });
  }

  void AddCart() {
    if (Cart.cartList != null) {
      if (Cart.cartList.isNotEmpty) {
        bool exists = false;
        for (int i = 0; i < Cart.cartList.length; i++) {
          if (Cart.cartList[i].idProduct == widget.product!.id) {
            Cart.cartList[i].quantityProduct =
                Cart.cartList[i].quantityProduct + _counter;
            setState(() {
              Cart.cartList[i].quantityProduct;
              Cart.cartList[i].newCost = int.parse(widget.product!.price) *
                  Cart.cartList[i].quantityProduct;
              exists = true;
            });
          }
        }
        if (exists == false) {
          Cart.cartList.add(Cart(
              idProduct: widget.product!.id,
              nameProduct: widget.product!.name,
              costProduct: int.parse(widget.product!.price),
              imageProduct: widget.product!.image,
              quantityProduct: _counter,
              newCost: NewCost));
        }
      } else {
        Cart.cartList.add(Cart(
            idProduct: widget.product!.id,
            nameProduct: widget.product!.name,
            newCost: NewCost,
            imageProduct: widget.product!.image,
            quantityProduct: _counter,
            costProduct: int.parse(widget.product!.price)));
      }
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('AlertDialog Title'),
                content: const Text('Bạn muốn xem giỏ hàng'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartPage(
                                  cart: null,
                                )),
                      );
                    },
                    child: const Text('OK'),
                  ),
                ],
              ));
    } else if (_counter <= 0) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          content: Text('Số lượng sản phẩm phải lớn hơn 0'),
        ),
      );
      return;
    } else {
      Cart.cartList = [];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    NewCost = int.parse(widget.product!.price) * 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết"),
      ),
      body: Container(
        color: Colors.blue.shade100,
        margin: EdgeInsets.only(left: 2,right: 2),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 1,offset: Offset(8,6))]
                  ),
                  child: Center(
                    child: Hero(
                        tag: "Photo ${widget.product!.id}",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage.assetNetwork(
                              placeholder: 'images/no_image.jpg',
                              image: widget.product!.image),
                        )),
                  ),
                ),
                Text(
                  widget.product!.name,
                  style: const TextStyle(color: Colors.black, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    "Giá sản phẩm:  ${NumberFormat("###,###,###", "en_US").format(int.parse(widget.product!.price))} đ",
                    style: const TextStyle(color: Colors.black, fontSize: 16)),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Số lượng",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: MinusQuantity,
                                    child: const Text(
                                      "-",
                                      style: TextStyle(fontSize: 32),
                                    )),
                              ),
                              Container(
                                color: Colors.grey.shade200,
                                width: 50,
                                height: 50,
                                child: Center(
                                    child: Text(
                                  "$_counter",
                                )),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: AddQuantity,
                                    child: const Text(
                                      "+",
                                      style: TextStyle(fontSize: 32),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: AddCart,
                            child: const Text(
                              "Đặt Hàng",
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Tổng tiền: ${NumberFormat("###,###,###", "en_US").format(NewCost)} đ",
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Chi tiết sản phẩm",
                    style: TextStyle(color: Colors.blueAccent)),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text( widget.product!.description,
                          style: const TextStyle(color: Colors.black)),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
