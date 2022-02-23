import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_demo/model/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name.toString(),
                    maxLines: 1,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: "Laptop ${product.name}",
                          child: FadeInImage.assetNetwork(
                            placeholder: 'images/no_image.jpg',
                            image: product.image,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "${NumberFormat("###,###,###", "en_US").format( int.parse(product.price))} đ",
                      maxLines: 1,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Image.network(
                        'https://vnsea.com.vn/wp-content/uploads/2017/12/new.png'),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
