import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parmacy/Customer/CustomerPart.dart';
import 'package:parmacy/Supplier/SupplierPart.dart';
import 'package:http/http.dart' as http;
import 'package:parmacy/api-services/Connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

//customer
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  void initState() {
    super.initState();
    user();
    super.initState();
  }

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null && prefs.getString('cid') != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => CustomerPart()),
          (Route<dynamic> route) => false);
    }
  }

  Future<String> loginCustomer(email, password) async {
    var ip = Configuration.base_url;
    var url = "$ip/auth/customerlogin"; //
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
//print(response.body);
    var parse = jsonDecode(response.body);
    print(parse["token"]);
    print(parse["nic"]);
    if (parse["token"] != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', parse["token"]);
      await prefs.setString('userEmail1', parse["email"]);
      await prefs.setString('cid', parse["id"]);
      await prefs.setString('fname', parse["fname"]);
      await prefs.setString('lname', parse["lname"]);
      await prefs.setString('nic', parse["nic"]);
      await prefs.setString('address', parse["address"]);
      await prefs.setString('phone', parse["phone"]);
      await prefs.setString('password1', (parse["password"]).toString());
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Login Success!!',
        desc: 'Welcome' + parse["fname"],
        btnOkOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CustomerPart()));
        },
      )..show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Login Failed!!',
        desc: 'Something is Wrong.. Please Try Again..',
        btnCancelOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
      )..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          color: Colors.grey,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.fromLTRB(80.0, 40.0, 80.0, 0.0),
                child: Image(
                    image: AssetImage('assets/images/epharmacy_logo.jpg')),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                child: InkWell(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 15.0, color: Colors.green),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 40.0,
                width: 220.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green,
                  child: GestureDetector(
                    onTap: () {
                      if (_email.text == '' || _password.text == '') {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Login Failed!!',
                          desc: 'All Fields Required.. Please Try Again..',
                          btnCancelOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          btnOkOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                        )..show();
                      } else {
                        loginCustomer(_email.text, _password.text);
                      }
                    },
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
