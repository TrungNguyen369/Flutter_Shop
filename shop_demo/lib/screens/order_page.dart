import 'package:flutter/material.dart';
import 'package:shop_demo/connect/connect.dart';
import 'package:shop_demo/model/cart.dart';
import 'package:shop_demo/model/customer.dart';
import 'package:shop_demo/screens/home.dart';


class OrderPage extends StatefulWidget {
  const OrderPage( {Key? key,}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  late TextEditingController NameCustomer = TextEditingController();
  late TextEditingController PhoneCustomer = TextEditingController();
  late TextEditingController EmailCustomer = TextEditingController();
  late TextEditingController AddDressCustomer = TextEditingController();
  late String idCustomer = "";

  @override
   void initState() {
     // TODO: implement initState
     super.initState();
     Customer.exsist = true;
     Services.getCustomer(Customer.useName, Customer.passWord).then((value) {
       setState(() {
         Customer.customer = value;
         print(Customer.customer.length);
       });
       Customer.customer.map((e) {
         idCustomer = e.id.toString();
         NameCustomer.text = e.name.toString();
         PhoneCustomer.text = e.phone.toString();
         EmailCustomer.text = e.email.toString();
         AddDressCustomer.text = e.address.toString();
       }).toList();
     });
   }
   _Order(){
    if(Cart.cartList.length == 0){
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => const AlertDialog(
          content: Text('Giỏ hàng bạn đang trống'),
        ),
      );
      return;
    }
     if (NameCustomer.text.isEmpty || PhoneCustomer.text.isEmpty || EmailCustomer.text.isEmpty || AddDressCustomer.text.isEmpty) {
       print("Empty Fieds");
       return;
     }
     print("${Cart.cartList.length}");
     Services.addCustomer(NameCustomer.text, PhoneCustomer.text, AddDressCustomer.text, idCustomer);

     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => Home()),
     );
     showDialog<String>(
       context: context,
       builder: (BuildContext context) => const AlertDialog(
         content: Text('Bạn đã đặt hàng thành công'),

       ),
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue,
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: const Text(
                      "Thông tin khác hàng",
                      style: TextStyle(fontSize: 32, color: Colors.red),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: NameCustomer,
                    decoration:  const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tên khách hàng',
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: PhoneCustomer,
                    decoration:  const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Số điện thoại khách hàng',
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: EmailCustomer,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email khách hàng',
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: AddDressCustomer,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Địa chỉ giao hàng',
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          },
                          child: const Text(
                            "Quay lại trang chủ",
                          )),
                      ElevatedButton(
                          onPressed: _Order,
                          child: const Text(
                            "Đặt Hàng",
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
