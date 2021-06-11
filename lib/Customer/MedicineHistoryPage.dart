import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:parmacy/Customer/OnlinePaymentPage.dart';
import 'package:parmacy/Supplier/SupplierPart.dart';
import 'package:parmacy/api-services/Connection.dart';
import 'package:parmacy/controllers/orderListCust.dart';
import 'package:parmacy/state/logout.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';

class MedicineHistoryPage extends StatefulWidget {
  @override
  _MedicineHistoryPageState createState() => _MedicineHistoryPageState();
}

var id;

class _MedicineHistoryPageState extends State<MedicineHistoryPage> {
  void initState() {
    super.initState();
    user();
    super.initState();
  }

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("cid");
    setState(() {});
  }

  List data;
  var ip = Configuration.base_url;

  Future<List> getData() async {
    final response = await http.get("$ip/precription/customerPrecriptions/$id");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                );
              }),
        ],
        backgroundColor: Colors.blue,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new OrderListCust(
                  list: snapshot.data,
                )
              : new Center(
                  child: Text(
                    "No Orders Found Belongs to You!!!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20),
                  ),
                );
        },
      ),
    );
  }
}
