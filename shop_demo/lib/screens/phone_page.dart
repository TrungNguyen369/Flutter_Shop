import 'package:flutter/material.dart';
import 'package:shop_demo/connect/connect.dart';
import 'package:shop_demo/model/product.dart';
import 'package:shop_demo/screens/detail_page.dart';
import 'package:shop_demo/widget/card.dart';
import 'package:shop_demo/widget/card_product.dart';
import '../widget/gird_cell_new_product.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {


  gotoDetailsPage(BuildContext context, Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(

            builder: (BuildContext context) => GirdDetails(product: product)));
  }

  // gridview(AsyncSnapshot<List<Product>> snapshot) {
  //   return Padding(
  //     padding: const EdgeInsets.all(5),
  //     child: GridView.count(
  //         crossAxisCount: 2,
  //         childAspectRatio: 1,
  //         mainAxisSpacing: 4,
  //         crossAxisSpacing: 4,
  //         children: snapshot.data!.map((sanpham) {
  //           return GestureDetector(
  //             child: GridTile(child: CardProduct(sanpham)),
  //             onTap: () {
  //               gotoDetailsPage(context, sanpham);
  //             },
  //           );
  //         }).toList()),
  //   );
  // }

  listview(AsyncSnapshot<List<Product>> snapshot){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListView(
          children: snapshot.data!.map((product) {
            return GestureDetector(
              child: GridTile(child: CardProduct(product)),
              onTap: () {
                gotoDetailsPage(context, product);
              },
            );
          }).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: FutureBuilder<List<Product>>(
                future: Services.fetchPhone(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return listview(snapshot);
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
