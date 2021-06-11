import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Customers Steps',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 30.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '1. First Register to the OPMS or Login to the OPMS \n\n2. Choose a nearest pharmacy to you \n\n3. Send the prescription to the Pharmacy \n\n4. Do the payments through this OPMS \n\n5. Accept your deliverables',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40.0),
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Suppliers Steps',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 30.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '1. First Register to the OPMS or Login to the OPMS \n\n2. See the customer requests and accept the requests \n\n3. According to the customers prescription, prepare the medicine \n\n4. Generate the bill through OPMS and sent it to the customer \n\n5. After the payments, deliver medicines to the customer',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
