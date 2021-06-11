import 'package:flutter/material.dart';

class OrderDetailsPage extends StatefulWidget {
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ),

      body: Container(
        child: Column(
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                alignment: Alignment.topCenter,
                child: Text(
                  'ORDER DETAILS',
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
                decoration: InputDecoration(
                  labelText: 'ORDER ID ',
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
                decoration: InputDecoration(
                  labelText: 'ORDER DATE',
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
                decoration: InputDecoration(
                  labelText: 'BILLING ADDRESS',
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
                decoration: InputDecoration(
                  labelText: 'EMAIL',
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
                decoration: InputDecoration(
                  labelText: 'EMAIL',
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
                decoration: InputDecoration(
                  labelText: 'PRESCRIPTION DETAILS',
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
                decoration: InputDecoration(
                  labelText: 'TOTAL PRICE',
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
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 19.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
