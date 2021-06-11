import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parmacy/Screen/supLogin.dart';
import 'package:parmacy/Screen/supregpage.dart';

import 'aboutpage.dart';
import 'contactpage.dart';
import 'cusregpage.dart';
import 'homepage.dart';
import 'loginpage.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.fromLTRB(90.0, 0.0, 90.0, 0.0),
                child: Image(
                    image: AssetImage('assets/images/epharmacy_logo.jpg')),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new HomePage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30.0),
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'HOME',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new AboutPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 12.0),
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'ABOUT US',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ContactPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 12.0),
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'CONTACT US',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new CusRegPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 12.0),
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'CUSTOMER REGISTER',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SupRegPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 12.0),
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'SUPPLIER REGISTER',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new LoginPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 12.0),
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'CUSTOMER LOGIN',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new SupplierLoginPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 12.0),
                  height: 50.0,
                  width: 220.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'SUPPLIER LOGIN',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
