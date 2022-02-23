import 'package:flutter/material.dart';
import 'package:shop_demo/connect/connect.dart';
import 'package:shop_demo/model/product.dart';
import 'package:shop_demo/screens/detail_page.dart';
import 'package:shop_demo/widget/card_product.dart';

class ProductNewPage extends StatefulWidget {
  const ProductNewPage({Key? key}) : super(key: key);

  @override
  _ProductNewPageState createState() => _ProductNewPageState();
}

class _ProductNewPageState extends State<ProductNewPage> {

  gotoDetailsPage(BuildContext context, Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GirdDetails(product: product)));
  }

  gridview(AsyncSnapshot<List<Product>> snapshot) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: snapshot.data!.map((product) {
              return GestureDetector(
                child: GridTile(child: ProductCardNew(product)),
                onTap: () {
                  gotoDetailsPage(context, product);
                },
              );
            }).toList()),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: FutureBuilder<List<Product>>(
                future: Services.fetchNewProduct(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return gridview(snapshot);
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )),
        ],
      ),
    );
  }
}

