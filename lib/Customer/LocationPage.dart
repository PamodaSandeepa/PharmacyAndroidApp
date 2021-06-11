import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:parmacy/api-services/Connection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AddOrder.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

var id;

class _LocationPageState extends State<LocationPage> {
  List<PharmaciesItems> _Pharmacies;

  void initState() {
    super.initState();
    user();
    FetchpharmacysList();
    super.initState();
  }

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("cid");
    setState(() {});
  }

  FetchpharmacysList() async {
    var ip = Configuration.base_url;
    var data = await http.get("$ip/supplier/suppliers");
    var jsonData = json.decode(data.body);
    print(id);
    List<PharmaciesItems> pharmacyList = [];

    for (var u in jsonData) {
      PharmaciesItems pharmacy = PharmaciesItems(
          u["fname"], u["lname"], u["phone"], u["email"], u["city"], u["_id"]);
      pharmacyList.add(pharmacy);
      print(pharmacy.fname +
          " " +
          pharmacy.lname +
          " " +
          pharmacy.phone +
          " " +
          pharmacy.email +
          " " +
          pharmacy.city +
          " " +
          pharmacy.pid);
    }

    this.setState(() {
      _Pharmacies = pharmacyList;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50.0),
                alignment: Alignment.topCenter,
                child: Text(
                  'Pharmacies List',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 25.0),
                ),
              ),
              _Pharmacies == null
                  ? Text("No Pharmacies Found")
                  : SingleChildScrollView(
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                              label: Text('First Name'), tooltip: 'First Name'),
                          DataColumn(
                              label: Text('Last Name'), tooltip: 'Last Name'),
                          DataColumn(
                              label: Text('Contact'), tooltip: 'Contact'),
                          DataColumn(label: Text('Email'), tooltip: 'Email'),
                          DataColumn(label: Text('City'), tooltip: 'City'),
                          DataColumn(
                              label: Text('Make My Order'),
                              tooltip: 'Make My Order'),
                        ],
                        rows: _Pharmacies.map(
                          ((element) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(element.fname)),
                                  DataCell(Text(element.lname)),
                                  DataCell(Text(element.phone)),
                                  DataCell(Text(element.email)),
                                  DataCell(Text(element.city)),
                                  DataCell(
                                    RaisedButton(
                                        color: Colors.deepOrange,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        elevation: 2,
                                        onPressed: () async {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          await prefs.setString(
                                              'pharmacyId', element.pid);
                                          await prefs.setString(
                                              'pharmacyCon', element.phone);
                                          await prefs.setString(
                                              'pharmacyName', element.fname);
                                          await prefs.setString(
                                              'pharmacyCity', element.city);
                                          Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new AddOrder()));
                                        },
                                        child: Text(
                                          "Make My Order",
                                          style: TextStyle(
                                              fontSize: 14,
                                              letterSpacing: 2.2,
                                              color: Colors.black),
                                        )),
                                  ),
                                ],
                              )),
                        ).toList(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url =
        'https://download1506.mediafire.com/gibhih9m64cg/9cvowuirka4djq9/myfile.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class PharmaciesItems {
  final String fname;
  final String lname;
  final String phone;
  final String email;
  final String city;
  final String pid;
  PharmaciesItems(
      this.fname, this.lname, this.phone, this.email, this.city, this.pid);
}
