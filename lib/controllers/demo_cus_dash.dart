// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:parmacy/Customer/OnlinePaymentPage.dart';
// import 'package:parmacy/Supplier/SupplierPart.dart';
// import 'package:parmacy/api-services/Connection.dart';
// import 'package:parmacy/state/logout.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'AboutUsPage.dart';
// import 'LocationPage.dart';
// import 'MedicineHistoryPage.dart';
// import 'SettingsPage.dart';
//
// import 'package:url_launcher/url_launcher.dart';
//
// class CustomerPart extends StatefulWidget {
//   @override
//   _CustomerPartState createState() => _CustomerPartState();
// }
// var id;
// class _CustomerPartState extends State<CustomerPart> {
//   List<OrderItems> _Orders;
//
//   void initState() {
//     super.initState();
//     user ();
//     FetchordersList();
//     super.initState();
//   }
//   user () async {
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     id= prefs.getString("cid");
//     setState(() {});
//   }
//
//   FetchordersList() async {
//
//     var ip = Configuration.base_url;
//     var data = await http.get("$ip/precription/customerPrecription/$id");
//     var jsonData = json.decode(data.body);
//     print(id);
//     List<OrderItems> ordertList = [];
//
//     for (var u in jsonData) {
//       OrderItems visit = OrderItems(u["_id"],  u["date"],u["pcontact"], u["total"], u["status"], u["payment"]);
//       ordertList.add( visit);
//       print( visit.invoce+" "+ visit.date+" "+visit.phone+" " + visit.total+" "+ visit.status + " " + visit.payments);
//     }
//
//     this.setState(() {
//       _Orders = ordertList;
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       drawer: new Drawer(
//         child: Column(children: <Widget>[
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(20),
//             color: Theme.of(context).primaryColor,
//             child: Center(
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     width: 100,
//                     height: 100,
//                     margin: EdgeInsets.only(
//                       top: 30,
//                       bottom: 10,
//                     ),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: NetworkImage(
//                             'https://cdn4.iconfinder.com/data/icons/ios-web-user-interface-multicolor-vol-1/512/Account_Audience_person_customer_profile_user-512.png'),
//                       ),
//                     ),
//                   ),
//                   Text(
//                     'CUSTOMER',
//                     style: TextStyle(fontSize: 25, color: Colors.white),
//                   )
//                 ],
//               ), //
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.dashboard_outlined),
//             title: Text(
//               'Dashboard',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   new MaterialPageRoute(
//                       builder: (context) => new CustomerPart()));
//             },
//           ),
//           // dan hari, run karala balanna
//           ListTile(
//             leading: Icon(Icons.location_on_sharp),
//             title: Text(
//               'Pharmacies',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   new MaterialPageRoute(
//                       builder: (context) => new LocationPage()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.refresh_outlined),
//             title: Text(
//               'Medicine History',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   new MaterialPageRoute(
//                       builder: (context) => new MedicineHistoryPage()));
//             },
//           ),
//
//           ListTile(
//             leading: Icon(Icons.account_balance_sharp),
//             title: Text(
//               'About Us',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   new MaterialPageRoute(
//                       builder: (context) => new AboutUsPage()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text(
//               'Settings',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   new MaterialPageRoute(
//                       builder: (context) => new SettingsPage()));
//             },
//           ),
//
//           ///////////////////////////////////// You can delete this part : START //////////////////////
//           ListTile(
//             leading: Icon(Icons.logout),
//             title: Text(
//               'Logout',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   new MaterialPageRoute(
//                       builder: (context) => new  Logout()));
//             },
//           ),
//           ///////////////////////////////////// You can delete this part : END //////////////////////
//         ]),
//       ),
//       appBar: AppBar(
//         title: Text('Last 5 Order Details'),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 100.0),
//               alignment: Alignment.topCenter,
//               child: Text(
//                 'LAST 5 ORDER DETAILS',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                     fontSize: 25.0),
//               ),
//             ),
//             _Orders.isEmpty? Text("No Orders Found") :
//             DataTable(
//               columns: const <DataColumn>[
//                 DataColumn(label: Text('Invoice Nu'), tooltip: 'Invoice Nu'),
//                 DataColumn(label: Text('Date'), tooltip: 'Date'),
//                 DataColumn(label: Text('Supplier Con'), tooltip: 'Supplier Con'),
//                 DataColumn(label: Text('Total'), tooltip: 'Total'),
//                 DataColumn(label: Text('Order Status'), tooltip: 'Order Status'),
//                 DataColumn(label: Text('Payments'), tooltip: 'Payments'),
//                 DataColumn(label: Text('Make Payments'), tooltip: 'Make Payments'),
//               ],
//               rows:
//               _Orders
//                   .map(
//                 ((element) => DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text(element.invoce)),
//                     DataCell(Text(element.date)),
//                     DataCell(Text(element.phone)),
//                     DataCell(Text(element.total)),
//                     DataCell(Text(element.payments)),
//                     DataCell(Text(element.payments)),
//                     DataCell(RaisedButton(
//                         color: Colors.red,
//                         padding: EdgeInsets.symmetric(horizontal:30),
//                         elevation: 2,
//                         onPressed: () => {
//                           Navigator.push(context,new MaterialPageRoute(builder: (context)=> new OnlinePaymentPage()))
//                         },
//                         child: Text(
//                           "Make Payment",
//                           style: TextStyle(
//                               fontSize: 14,
//                               letterSpacing: 2.2,
//                               color: Colors.black),
//                         )
//                     ),),
//                   ],
//                 )),
//               ).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   _launchURL() async {
//     const url =
//         'https://download1506.mediafire.com/gibhih9m64cg/9cvowuirka4djq9/myfile.pdf';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
// class OrderItems {
//   final String invoce;
//   final String date;
//   final String phone;
//   final String total;
//   final String status;
//   final String payments;
//   OrderItems(this.invoce,this.date, this.phone, this.total, this.status, this.payments);
//
// }