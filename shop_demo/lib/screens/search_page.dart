import 'package:flutter/material.dart';
import 'package:shop_demo/connect/connect.dart';
import 'package:shop_demo/model/product.dart';
import 'package:shop_demo/widget/card.dart';


import 'detail_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  late TextEditingController searchController ;
  late List<Product> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  gotoDetailsPage(BuildContext context, Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GirdDetails(product: product)));
  }

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
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(title: Text("Tìm Kiếm"),),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: TextField(
                    controller: searchController,
                    decoration:  const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tên sản phẩm',
                    ),
                  ),
                ),
                Expanded( flex: 1, child: IconButton(
                    onPressed: (){
                      Services.getSearch(searchController.text).then((data) {
                        setState(() {
                          list = data;
                        });
                        print('Length ${data.length}');
                      });
                },
                    icon: Icon(Icons.search,color: Colors.blueAccent,)
                ))
              ],
            ),
          ),
          Flexible(
              child: FutureBuilder<List<Product>>(
                future: Services.getSearch(searchController.text),
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
      )
    );
  }
}
