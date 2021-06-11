import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:parmacy/api-services/Connection.dart';

import 'SupplierPart.dart';

class OrderStatusPage extends StatefulWidget {
  List list;
  int index;
  OrderStatusPage({this.index, this.list});
  @override
  _OrderStatusPageState createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  Future<String> sendEmail(id, email, status, details, total) async {
    var ip = Configuration.base_url;
    var url = "$ip/precription/updateOrder"; //
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'email': email,
        'detail': details,
        'status': status,
        'total': total
      }),
    );

    var parse = response.statusCode;

    if (parse == 200) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Email Send  Success!!',
        desc: 'Oky..',
        btnOkOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SupplierPart()));
        },
      )..show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Email send  Failed!!',
        desc: 'Something goes wrong',
        btnCancelOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SupplierPart()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SupplierPart()));
        },
      )..show();
    }
  }

  List<String> _locations = ['Pending', 'Canceled', 'Completed'];
  String _selectedStats;

  @override
  Widget build(BuildContext context) {
    var image_base = Configuration.server_base_url;
    var email = "${widget.list[widget.index]['email']}";
    var oid = "${widget.list[widget.index]['_id']}";
    var __image = "${widget.list[widget.index]['image']}";
    print(__image);
    var details, total, std;
    var img =
        "$image_base/uploads/prescriptions/${widget.list[widget.index]['cid']}${widget.list[widget.index]['image']}";

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

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'ORDER STATUS',
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
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: "Invoice: ${widget.list[widget.index]['_id']}",
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
                    labelText: "Date:  ${widget.list[widget.index]['date']}",
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
                    labelText:
                        "Address:  ${widget.list[widget.index]['address']}",
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
                    labelText: "Email:  ${widget.list[widget.index]['email']}",
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
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Prescription:",
                        style: TextStyle(color: Colors.grey, fontSize: 16.0),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    ClipRect(
                      child: Container(
                        child: Align(
                            alignment: Alignment.center,
                            widthFactor: 1.0,
                            heightFactor: 0.8,
                            child: __image != null
                                ? Image.network("$__image")
                                : null),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: new DropdownButton(
                  hint:
                      Text('Set the Order State'), // Not necessary for Option 1
                  value: _selectedStats,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedStats = newValue;
                    });
                  },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText:
                        "Payments: + ${widget.list[widget.index]['payment']}",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              /*        Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: Image.network(img),
              ),  */
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Add Order Details',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onChanged: (value) {
                    details = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'TOTAL AMOUNT',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onChanged: (value) {
                    total = value;
                  },
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
                      // print("Hello    " +oid);
                      sendEmail(oid, email, _selectedStats, details, total);
                    },
                    child: Center(
                      child: Text(
                        'Email',
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
