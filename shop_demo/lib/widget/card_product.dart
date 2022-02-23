import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_demo/model/product.dart';

class ProductCardNew extends StatelessWidget {
  final Product product;
  const ProductCardNew(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      color:  Colors.white70,
      child: Container(
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 4,offset: Offset(4,8))]
              ),
              child: Column(
                children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Hero(
                                  tag: "Laptop ${product.name}",
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'images/no_image.jpg',
                                    image: product.image,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],),
            ),
            Text(
              product.name.toString(),
              maxLines: 1,
              softWrap: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16, color: Colors.black87),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "${NumberFormat("###,###,###", "en_US").format( int.parse(product.price))} đ",
                maxLines: 1,
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600, ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
