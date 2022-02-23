import 'package:flutter/material.dart';
import 'package:shop_demo/model/cart.dart';
import 'package:shop_demo/model/customer.dart';
import 'package:shop_demo/screens/order_page.dart';
import 'package:shop_demo/widget/carousel_slider.dart';
import 'package:shop_demo/screens/detail_page.dart';
import 'package:shop_demo/screens/phone_page.dart';
import 'package:shop_demo/screens/laptop_page.dart';
import 'package:shop_demo/screens/cart_page.dart';

import 'login_page.dart';
import 'search_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Carousel_Slider(),
    LaptopPage(),
    PhonePage(),
    Customer.exsist == true ? OrderPage():LoginPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
       _widgetOptions = <Widget>[
        Carousel_Slider(),
        LaptopPage(),
        PhonePage(),
        Customer.exsist == true? OrderPage():LoginPage(),
      ];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Shop Online',
            textAlign: TextAlign.center,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage(cart: null)),
            );
          }),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search()),
                );
              }),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop),
            label: 'Laptop Gaming',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: 'Điện Thoại',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white54,
        onTap: _onItemTapped,
      ),
    );
  }
}
