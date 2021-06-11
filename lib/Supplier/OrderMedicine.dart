import 'package:flutter/material.dart';

class OrderMedicinePage extends StatefulWidget {
  @override
  _OrderMedicinePageState createState() => _OrderMedicinePageState();
}

class _OrderMedicinePageState extends State<OrderMedicinePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),

          child: ListView(
            children: [
              Text(
                "Order Medicine",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "FirstName",
                      labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "LastName",
                      labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Billing Address",
                      labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "NIC",
                      labelStyle: TextStyle(fontSize: 14, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Add Your Prescription Photo",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),

              // buildTextField("First Name", "Enter First Name",false),
              // buildTextField("Last Name", "Enter Last Name", false),
              // buildTextField("Billing Address", "Enter Billing Address ",false),
              // buildTextField("Email", "Enter Email",false),
              // buildTextField("NIC", "NIC", false),
              SizedBox(
                height: 35,
              ), //SizeBox
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: null,
                    tooltip: "Pick Image From Camera",
                    child: Icon(Icons.camera),
                  ),
                  FloatingActionButton(
                    onPressed: null,
                    tooltip: "Pick Image From Gallery",
                    child: Icon(Icons.folder),
                  ),
                  RaisedButton(
                      color: Colors.greenAccent,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20)), //RoundRectangleBorder
                      child: Text(
                        "ORDER",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black),
                      )),
                ],
              ), //Row
            ],
          ), //ListView
        ));
  }
}
