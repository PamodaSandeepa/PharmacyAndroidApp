import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:parmacy/controllers/paypalPayments.dart';

class makePayment extends StatefulWidget {

  @override
  _makePaymentState createState() => _makePaymentState();
}

class _makePaymentState extends State<makePayment> {

  TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () => Navigator.pop(context),
            ),
            title: Text("Make your Medicine order  Payment"),
          ),
          body:Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: (){

                        // make PayPal payment

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => PaypalPayment(
                              onFinish: (number) async {

                                // payment done
                                print('order id: '+number);

                              },
                            ),
                          ),
                        );


                      },
                      child: Text('Pay with PayPal', textAlign: TextAlign.center,),
                    ),

                  ],
                ),
              )
          ),
        )
    );
  }

}