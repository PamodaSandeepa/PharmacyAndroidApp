import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parmacy/api-services/Connection.dart';
import 'package:parmacy/controllers/ordersSup.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'OrderDetailes.dart';
import 'OrderStatus.dart';
class ViewOrder extends StatefulWidget {
@override
_ViewOrderState createState() => _ViewOrderState();
}

var id;
class _ViewOrderState extends State<ViewOrder> {


  void initState() {
    super.initState();
    user ();
    super.initState();

  }
  user () async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _id= prefs.getString("sid");
    id = _id;

    setState(() {});

  }
  List data;
  var ip = Configuration.base_url;
  Future<List> getData() async {
    final response = await http.get("$ip/precription/precription/$id");
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold
      (
      appBar: AppBar(
        title: Text('Order Details'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Navigator.pushNamed(context, '/');
            Navigator.of(context).pop(true);
          },
        ),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new SupOrderListById(
            list: snapshot.data,
          )
              : new Center(
            child: Text("No Orders Found Belongs to You!!!", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red, fontSize: 20),),
          );
        },
      ),

    );
  }
}

