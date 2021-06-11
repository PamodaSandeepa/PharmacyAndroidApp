import 'dart:core';
import 'package:flutter/material.dart';
import 'package:parmacy/Customer/CustomerPart.dart';
import 'package:parmacy/api-services/Connection.dart';
import 'package:parmacy/controllers/paymentConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PaypalPayment extends StatefulWidget {
  final Function onFinish;

  PaypalPayment({this.onFinish});

  @override
  State<StatefulWidget> createState() {
    return PaypalPaymentState();
  }
}

class PaypalPaymentState extends State<PaypalPayment> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String checkoutUrl;
  String executeUrl;
  String accessToken;
  String order_id;
  String totalrice;
  PaypalServices services = PaypalServices();






  // you can change default currency according to your need
  Map<dynamic,dynamic> defaultCurrency = {"symbol": "USD ", "decimalDigits": 2, "symbolBeforeTheNumber": true, "currency": "USD"};

  bool isEnableShipping = false;
  bool isEnableAddress = false;

  String returnURL = 'return.example.com';
  String cancelURL= 'cancel.example.com';


  @override
  void initState() {
    super.initState();
    user();
    super.initState();


    Future.delayed(Duration.zero, () async {
      try {
        accessToken = await services.getAccessToken();

        final transactions = getOrderParams();
        final res =
        await services.createPaypalPayment(transactions, accessToken);
        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"];
            executeUrl = res["executeUrl"];
          });
        }
      } catch (e) {
        print('exception: '+e.toString());
        final snackBar = SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 10),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    });
  }
  Future<http.Response>  payment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString("ticket-id");

    Map ticket = {
      "payment": "paid",

    };

  }
  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id = prefs.getString("invoce-id");
    print(_id);
    totalrice = prefs.getString("order-price");
  }
  // item name, price and quantity
  String itemName = 'Medicine ';
  int quantity = 1;

  Map<String, dynamic> getOrderParams() {
    List items = [
      {
        "name": itemName,
        "quantity": quantity,
        "price": totalrice,
        "currency": defaultCurrency["currency"]
      }
    ];


    // checkout invoice details
    String totalAmount = totalrice;
    String subTotalAmount = totalrice;
    String shippingCost = '0';
    int shippingDiscountCost = 0;
    String userFirstName = 'Gulshan';
    String userLastName = 'Yadav';
    String addressCity = 'Dehiwala';
    String addressStreet = 'Colombo Road';
    String addressZipCode = '454654';
    String addressCountry = 'Srilnka';
    String addressState = 'Dehiwala';
    String addressPhoneNumber = '+919990119091';

    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": totalAmount,
            "currency": defaultCurrency["currency"],
            "details": {
              "subtotal": subTotalAmount,
              "shipping": shippingCost,
              "shipping_discount":
              ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
            if (isEnableShipping &&
                isEnableAddress)
              "shipping_address": {
                "recipient_name": userFirstName +
                    " " +
                    userLastName,
                "line1": addressStreet,
                "line2": "",
                "city": addressCity,
                "country_code": addressCountry,
                "postal_code": addressZipCode,
                "phone": addressPhoneNumber,
                "state": addressState
              },
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your Medicine order.",
      "redirect_urls": {
        "return_url": returnURL,
        "cancel_url": cancelURL
      }
    };
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    print(checkoutUrl);

    if (checkoutUrl != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: WebView(
          initialUrl: checkoutUrl,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.contains(returnURL)) {
              final uri = Uri.parse(request.url);
              final payerID = uri.queryParameters['PayerID'];
              if (payerID != null) {
                services
                    .executePayment(executeUrl, payerID, accessToken)
                    .then((id) {
                  widget.onFinish(id);
                  payment();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerPart()),
                  );
                });
              } else {
                payment();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomerPart()),
                );
              }
              payment();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerPart()),
              );
            }
            if (request.url.contains(cancelURL)) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerPart()),
              );
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    } else {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: Center(child: Container(child: CircularProgressIndicator())),
      );
    }
  }
}