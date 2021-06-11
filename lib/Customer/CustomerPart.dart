import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parmacy/Customer/OnlinePaymentPage.dart';
import 'package:parmacy/Supplier/SupplierPart.dart';
import 'package:parmacy/api-services/Connection.dart';
import 'package:parmacy/controllers/orderListCust.dart';
import 'package:parmacy/state/logout.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'AboutUsPage.dart';
import 'LocationPage.dart';
import 'MedicineHistoryPage.dart';
import 'SettingsPage.dart';

import 'package:url_launcher/url_launcher.dart';

class CustomerPart extends StatefulWidget {
@override
_CustomerPartState createState() => _CustomerPartState();
}
var id;
class _CustomerPartState extends State<CustomerPart> {


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
    final response = await http.get("$ip/precription/customerPrecription/$id");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Drawer(
        child: Column(children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme
                .of(context)
                .primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://cdn4.iconfinder.com/data/icons/ios-web-user-interface-multicolor-vol-1/512/Account_Audience_person_customer_profile_user-512.png'),
                      ),
                    ),
                  ),
                  Text(
                    'CUSTOMER',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )
                ],
              ), //
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard_outlined),
            title: Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CustomerPart()));
            },
          ),
          // dan hari, run karala balanna
          ListTile(
            leading: Icon(Icons.location_on_sharp),
            title: Text(
              'Pharmacies',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new LocationPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.refresh_outlined),
            title: Text(
              'Medicine History',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new MedicineHistoryPage()));
            },
          ),

          ListTile(
            leading: Icon(Icons.account_balance_sharp),
            title: Text(
              'About Us',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new AboutUsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SettingsPage()));
            },
          ),

          ///////////////////////////////////// You can delete this part : START //////////////////////
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new Logout()));
            },
          ),
          ///////////////////////////////////// You can delete this part : END //////////////////////
        ]),
      ),
      appBar: AppBar(
        title: Text('Last 5 Order Details'),
        backgroundColor: Colors.blue,
      ),
      body:
            new FutureBuilder<List>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? new OrderListCust(
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