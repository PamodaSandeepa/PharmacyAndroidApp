import 'package:flutter/material.dart';

class OnlinePaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold
      (
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
                  'Please add your payment details here to continue your order',
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
                  hintText: 'john M.Doe',
                  icon: Icon(Icons.people),
                  labelText: 'Full Name ',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'john@example.com',
                  icon: Icon(Icons.mail),
                  labelText: 'Email ',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '542 W.15th Street',
                  icon: Icon(Icons.home),
                  labelText: 'Address ',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'New York',
                  icon: Icon(Icons.opacity),
                  labelText: 'City ',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'NY',
                  icon: Icon(Icons.location_city_outlined),
                  labelText: 'State ',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '10001',
                  icon: Icon(Icons.location_city_outlined),
                  labelText: 'Zip ',
                  labelStyle: TextStyle(
                    color: Colors.grey,
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
                color: Colors.black,
                child: GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'PayPal Checkout',
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