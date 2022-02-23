import 'dart:convert';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop_demo/model/cart.dart';
import 'package:shop_demo/model/customer.dart';
import 'package:shop_demo/model/product.dart';
import 'package:shop_demo/screens/home.dart';

// class NetworkRequest {
//
//
//
//   static const String url = 'http://192.168.1.181/demo/getdata.php';
//
//   static List<SanPham> parseSanPham(String responseBody) {
//     var list = json.decode(responseBody) as List<dynamic>;
//     List<SanPham> sanpham =
//         list.map((model) => SanPham.fromJson(model)).toList();
//     return sanpham;
//   }
//
//   static Future<List<SanPham>> fetchSanPham() async {
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       return compute(parseSanPham, response.body);
//     } else {
//       throw Exception("Can\" get San Pham");
//     }
//   }
//
//   static const String url1 = 'http://192.168.1.181/demo/sanphammoi.php';
//
//   static List<SanPham> parseSanPhamMoi(String responseBody) {
//     var list = json.decode(responseBody) as List<dynamic>;
//     List<SanPham> sanpham =
//         list.map((model) => SanPham.fromJson(model)).toList();
//     return sanpham;
//   }
//
//   static Future<List<SanPham>> fetchSanPhamMoi() async {
//     final response = await http.get(Uri.parse(url1));
//     if (response.statusCode == 200) {
//       return compute(parseSanPham, response.body);
//     } else {
//       throw Exception("Can\" get San Pham");
//     }
//   }
//
//   static const String url2 = 'http://192.168.1.181/demo/getdata1.php';
//
//   static List<SanPham> parseSanPhamDT(String responseBody) {
//     var list = json.decode(responseBody) as List<dynamic>;
//     List<SanPham> sanpham =
//         list.map((model) => SanPham.fromJson(model)).toList();
//     return sanpham;
//   }
//
//   static Future<List<SanPham>> fetchSanPhamDT() async {
//     final response = await http.get(Uri.parse(url2));
//     if (response.statusCode == 200) {
//       return compute(parseSanPham, response.body);
//     } else {
//       throw Exception("Can\" get San Pham");
//     }
//   }
//
//   static const String url3 = 'http://192.168.1.181/demo/thongtinkhachhang.php';
//   static const String url4 = 'http://192.168.1.181/demo/chitietdonhang2.php';
//   static Future<String> addKh(
//       String tenkh, String sdtkh, String emailkh) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['tenkhachhang'] = tenkh;
//       map['sodienthoai'] = sdtkh;
//       map['email'] = emailkh;
//       final response = await http.post(Uri.parse(url3), body: map);
//       if (response.statusCode == 200) {
//         var map1 = Map<String, dynamic>();
//         for(int i = 0 ; i < ListGioHang.giohang.length; i++) {
//           map1['madonhang'] = response.body.toString();
//           map1['masanpham'] = ListGioHang.giohang[i].idsp.toString();
//           map1['tensanpham'] = ListGioHang.giohang[i].tensp.toString();
//           map1['giasanpham'] = ListGioHang.giohang[i].giasp.toString();
//           map1['soluongsanpham'] = ListGioHang.giohang[i].soluongsp.toString();
//           final response1 = await http.post(Uri.parse(url4), body: map1);
//         }
//         return response.body;
//       } else {
//         return "error";
//       }
//     } catch (e) {
//       return "error";
//     }
//   }
//
//   static const String url5 = 'http://192.168.1.181/demo/timkiemsanpham.php';
//   static Future<List<SanPham>> getSearch(String? tensanpham) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['tensanpham'] = tensanpham;
//       final response = await http.post(Uri.parse(url5), body: map);
//       print('gSearch ${response.body}');
//       if (response.statusCode == 200) {
//         List<SanPham> list = parseResponse(response.body);
//         print('$list');
//         return list;
//       } else {
//         throw <SanPham>[];
//       }
//     } catch (e) {
//       return <SanPham>[]; // return an empty on exception/error
//     }
//   }
//
//   static List<SanPham> parseResponse(String responseBody) {
//     final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//     return parsed.map<SanPham>((json) => SanPham.fromJson(json)).toList();
//   }
//
//   static const String url6 = 'http://192.168.1.181/demo/login.php';
//   static Future<List<KhachHang>> getKH(String? tenKH, String MK) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['tenkhachhang'] = tenKH;
//       map['matkhau'] = MK;
//       final response = await http.post(Uri.parse(url6), body: map);
//       print('g ${response.body}');
//       if (response.statusCode == 200) {
//         List<KhachHang> list = parseResponseKH(response.body);
//         print('g2 ${list.toList()}');
//         return list;
//       } else {
//         throw <KhachHang>[];
//       }
//     } catch (e) {
//       return <KhachHang>[]; // return an empty on exception/error
//     }
//   }
//
//   static List<KhachHang> parseResponseKH(String responseBody) {
//     final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//     return parsed.map<KhachHang>((json) => KhachHang.fromJson(json)).toList();
//   }
// }


class Services{

  static const String urlSever     = 'http://192.168.0.100/shopdemo/shopdemo.php';
  static const GET_NEW_PRODUCT     = 'GET_NEW_PRODUCT';
  static const GET_PHONE           = 'GET_PHONE';
  static const GET_LAPTOP          = 'GET_LAPTOP';
  static const GET_SEACRH_PRODUCT  = 'GET_SEACRH_PRODUCT';
  static const POST_ORDERS         = 'POST_ORDERS';
  static const POST_DETAILED_ORDER = 'POST_DETAILED_ORDER';
  static const GET_LOGIN           = 'GET_LOGIN';



  static List<Product> parseProduct(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Product> product =
    list.map((model) => Product.fromJson(model)).toList();
    return product;
  }

  // get data new product
  static Future<List<Product>> fetchNewProduct() async {
    var map = Map<String, dynamic>();
    map['action'] = GET_NEW_PRODUCT;
    final response = await http.post(Uri.parse(urlSever), body: map);
    print('get data new product table response: ${response.body}');
    if (response.statusCode == 200) {
      return compute(parseProduct, response.body);
    } else {
      throw Exception("Can\" get San Pham");
    }
  }

  // get data laptop
  static Future<List<Product>> fetchLaptop() async {
    var map = Map<String, dynamic>();
    map['action'] = GET_LAPTOP;
    final response = await http.post(Uri.parse(urlSever), body: map);
    print('get data laptop table response: ${response.body}');
    if (response.statusCode == 200) {
      return compute(parseProduct, response.body);
    } else {
      throw Exception("Can\" get San Pham");
    }
  }

  // get data phone
  static Future<List<Product>> fetchPhone() async {
    var map = Map<String, dynamic>();
    map['action'] = GET_PHONE;
    final response = await http.post(Uri.parse(urlSever), body: map);
    print('get data phone table response: ${response.body}');
    if (response.statusCode == 200) {
      return compute(parseProduct, response.body);
    } else {
      throw Exception("Can\" get San Pham");
    }
  }


  // post data customer
  static Future<String> addCustomer(
      String name, String phone,  String address, String  id_customer) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = POST_ORDERS;
      map['namecustomer'] = name;
      map['address'] = address;
      map['phone'] = phone;
      map['id_customer'] = id_customer;
      final response = await http.post(Uri.parse(urlSever), body: map);
      print(response.body);

      if (response.statusCode == 200) {

        // post data detailer product
        var map1 = Map<String, dynamic>();
        map1['action'] = POST_DETAILED_ORDER;
        for(int i = 0 ; i < Cart.cartList.length; i++) {
          print('asd ');
          print(Cart.cartList.length);
          map1['id_order'] = response.body.toString();
          map1['id_product'] = Cart.cartList[i].idProduct.toString();
          map1['name_product'] = Cart.cartList[i].nameProduct.toString();
          map1['price_product'] = Cart.cartList[i].costProduct.toString();
          map1['quantity_product'] = Cart.cartList[i].quantityProduct.toString();
         final responseDetail = await http.post(Uri.parse(urlSever), body: map1);
          print(responseDetail.body);
        }
        Cart.cartList = [];

        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }



  // get data search product
  static Future<List<Product>> getSearch(String? nameSearch) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = GET_SEACRH_PRODUCT;
      map['nameSearch'] = nameSearch;
      final response = await http.post(Uri.parse(urlSever), body: map);
      print('gSearch ${response.body}');
      if (response.statusCode == 200) {
        List<Product> list = parseProduct(response.body);
        print('$list');
        return list;
      } else {
        throw <Product>[];
      }
    } catch (e) {
      return <Product>[]; // return an empty on exception/error
    }
  }

  // login
  static Future<List<Customer>> getCustomer(String? usename, String password) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = GET_LOGIN;
      map['username'] = usename;
      map['password'] = password;
      final response = await http.post(Uri.parse(urlSever), body: map);
      print('g ${response.body}');
      if (response.statusCode == 200) {
        List<Customer> list = parseResponseCustomer(response.body);
        print('g2 ${list.toList()}');
        return list;
      } else {
        throw <Customer>[];
      }
    } catch (e) {
      return <Customer>[]; // return an empty on exception/error
    }
  }

  static List<Customer> parseResponseCustomer(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Customer>((json) => Customer.fromJson(json)).toList();
  }

}



