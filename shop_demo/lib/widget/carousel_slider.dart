import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_demo/screens/new_product.dart';


class Carousel_Slider extends StatefulWidget {
  const Carousel_Slider({Key? key}) : super(key: key);

  @override
  _Carousel_SliderState createState() => _Carousel_SliderState();
}

final List<String> imgList = [
  'https://cdn.tgdd.vn/2022/02/banner/S22-830-300-830x300-1.png',
  'https://cdn.tgdd.vn/2022/02/banner/830-300-830x300-4.png',
  'https://cdn.tgdd.vn/2022/02/banner/830-300-830x300-11.png',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.white
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class _Carousel_SliderState extends State<Carousel_Slider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
              ),
              items: imageSliders,
            ),
          ),
          const Text(
            'Sản phẩm mới',
            style: TextStyle(
                fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          Expanded(flex: 2, child: ProductNewPage()),
        ],
      ),
    );
  }
}
