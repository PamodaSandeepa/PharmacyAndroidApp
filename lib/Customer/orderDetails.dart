import 'package:flutter/material.dart';
import 'package:parmacy/controllers/paypal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailsPageCus extends StatefulWidget {
  List list;
  int index;
  OrderDetailsPageCus({this.index, this.list});
  @override
  _OrderDetailsPageCusState createState() => _OrderDetailsPageCusState();
}

class _OrderDetailsPageCusState extends State<OrderDetailsPageCus> {
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
                  enabled: false,
                  labelText:"Invoice No: ${widget.list[widget.index]['_id']}",
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
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Date: ${widget.list[widget.index]['date']}",
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
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Contact: ${widget.list[widget.index]['pcontact']}",
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
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Total Price: ${widget.list[widget.index]['total']}",
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
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Payments: ${widget.list[widget.index]['payment']}",
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
                  labelText: "Order Status: ${widget.list[widget.index]['status']}",
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
                color: Colors.red,
                child: GestureDetector(
                  onTap: () async  {
                    if(widget.list[widget.index]['total'] != "pending") {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('invoce-id',"${widget.list[widget.index]['_id']}");
                      await prefs.setString('order-price',"${widget.list[widget.index]['total']}");

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => makePayment()),
                      );
                    }



                  },
                  child: Center(
                    child:widget.list[widget.index]['total'] != "pending"? Text(
                      'Make Payment',
                      style: TextStyle(fontSize: 19.0, color: Colors.white),
                    ): Text(
                      'Pending',
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