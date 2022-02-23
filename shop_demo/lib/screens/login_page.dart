import 'package:flutter/material.dart';
import 'package:shop_demo/model/customer.dart';
import 'package:shop_demo/screens/order_page.dart';
import 'package:shop_demo/screens/home.dart';
import 'package:shop_demo/connect/connect.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

 Login(){
   Services.getCustomer(emailController.text, passwordController.text);
   Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderPage()));
 }


  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child:
            Image.network('https://img.icons8.com/officel/344/person-male.png'),
      ),
    );

    final email = TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Enter your email...',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Enter your password...',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = RaisedButton(
      child: const Text('Sign In'),
      textColor: Colors.white,
      color: Theme.of(context).accentColor,
      elevation: 10.0,
      splashColor: Colors.blueGrey,
      onPressed:
      (){
        setState(() {
          Login();
          Customer.exsist = true;
          Customer.useName = emailController.text;
          Customer.passWord = passwordController.text;
        });
      }
      ,
    );

    final forgotLabel = FlatButton(
      child: const Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final signUpLabel = FlatButton(
      child: const Text(
        'Sign Up',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.blue.shade100,
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
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 45.0),
              email,
              SizedBox(height: 10.0),
              password,
              SizedBox(height: 15.0),
              loginButton,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [forgotLabel , signUpLabel]
                ,)
            ],
          ),
        ),
      ),
    );
  }
}
