import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parmacy/Customer/CustomerPart.dart';
import 'package:parmacy/api-services/Connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginpage.dart';

class CusRegPage extends StatefulWidget {
  @override
  _CusRegPageState createState() => _CusRegPageState();
}

class _CusRegPageState extends State<CusRegPage> {
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _nic = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _password2 = TextEditingController();
  void initState() {
    super.initState();
    user();
  }

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null && prefs.getString('cid') != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => CustomerPart()),
          (Route<dynamic> route) => false);
    }
  }

  var ip = Configuration.base_url;

  Future<void> signup(String fname, String lname, String email, String password,
      String nic, String phone, String address) async {
    var url = "$ip/auth/customer/signup"; //
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fname': fname,
        'lname': lname,
        'nic': nic,
        // 'nicImg': 'ad.png',
        'email': email,
        'phone': phone,
        'address': address,
        //  'city': 'Kalutara',
        //  'image': 'pq.png',
        'password': password,
      }),
    );

    var parse = response.statusCode;

    if (parse == 201) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Registration  Success!!',
        desc: 'loggin..',
        btnOkOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
      )..show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Registration  Failed!!',
        desc: 'Something goes wrong',
        btnCancelOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CusRegPage()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CusRegPage()));
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
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text('Login'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'CUSTOMER REGISTRATION',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 25.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                child: TextField(
                  controller: _fname,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    hintText: 'John',
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
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  controller: _lname,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'Doe',
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
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'johndoe@gmail.com',
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
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: 'Password',
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
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  controller: _password2,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
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
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  controller: _nic,
                  decoration: InputDecoration(
                    labelText: 'NIC',
                    hintText: '123456789v',
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
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  controller: _phone,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    hintText: '0712345678',
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
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  controller: _address,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    hintText: '123, kandy road, colombo',
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
                margin: EdgeInsets.only(top: 20.0),
                height: 50.0,
                width: 150.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green,
                  child: GestureDetector(
                    onTap: () {
                      if (_password2.text != _password.text) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Sign up failed!!',
                          desc: 'Passwords Not Match..',
                          btnCancelOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CusRegPage()));
                          },
                          btnOkOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CusRegPage()));
                          },
                        )..show();
                      }
                      if (_fname.text == '' ||
                          _lname.text == '' ||
                          _email.text == '' ||
                          _address.text == '' ||
                          _password.text == '' ||
                          _nic.text == '' ||
                          _phone.text == '') {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Sign up failed!!',
                          desc: 'All Fields Required..',
                          btnCancelOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CusRegPage()));
                          },
                          btnOkOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CusRegPage()));
                          },
                        )..show();
                      } else {
                        signup(
                            _fname.text,
                            _lname.text,
                            _email.text,
                            _password.text,
                            _nic.text,
                            _phone.text,
                            _address.text);
                        print('Stored');
                      }
                    },
                    child: Center(
                      child: Text(
                        'REGISTER',
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
