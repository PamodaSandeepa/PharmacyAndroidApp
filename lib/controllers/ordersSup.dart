import 'package:flutter/material.dart';
import 'package:parmacy/Supplier/OrderStatus.dart';

class SupOrderListById extends StatelessWidget {

  final List list;
  SupOrderListById({this.list});


  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      shrinkWrap: true,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(15.0),
          child: new GestureDetector(
              onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context) => new OrderStatusPage (
                    list: list,
                    index: i,
                  ),
                ),
              ),
          child: new Card(
            child: new ListTile(
              leading: Icon(Icons.medical_services),
              title: new  RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: "Invoice:\t" + list[i]['_id'].toString(),

                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13),
                    children: [
                      TextSpan(
                          text: "\nTotal:\t" + list[i]['total'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13)),
                      TextSpan(
                          text: "\nPayment:\t" + list[i]['payment'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13)),
                      TextSpan(
                          text: "\nStatus:\t" + list[i]['status'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13)),
                      TextSpan(
                          text: "\nDate:\t" + list[i]['date'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13)),
                    ]
                ),

              ),

            ),
            //)
          ),
          )
        );
      },

    );
  }
}
