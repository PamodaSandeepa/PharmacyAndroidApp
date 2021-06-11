import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:parmacy/Screen/loginpage.dart';
import 'package:parmacy/api-services/Connection.dart';
import 'package:parmacy/state/logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

var id, fnm, lnm, nc, mail, cpw;

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _password = TextEditingController();
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _nic = TextEditingController();
  TextEditingController _email = TextEditingController();
  void initState() {
    super.initState();
    user();
    super.initState();
  }

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("cid");
    fnm = prefs.getString("fname");
    lnm = prefs.getString("lname");
    mail = prefs.getString("userEmail1");
    nc = prefs.getString("nic");
    cpw = prefs.getString("password1");
    print(cpw);
    _fname.text = fnm;
    _lname.text = lnm;
    _nic.text = nc;
    _email.text = mail;

    setState(() {});
  }

  Future<String> update(fname, lname, password, email, nic) async {
    var ip = Configuration.base_url;
    print(id);
    var url = "$ip/auth/updateCustomerm"; //
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fname': fname,
        'lname': lname,
        'nic': nic,
        'email': email,
        'id': id,
        'password': password,
      }),
    );

    var parse = response.statusCode;

    if (parse == 201 || parse == 200) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Update  Success!!',
        desc: 'Need to Logging Again..',
        btnOkOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Logout()));
        },
      )..show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Update   Failed!!',
        desc: 'Try Again..',
        btnCancelOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingsPage()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingsPage()));
        },
      )..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Edit Customer Profile",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://cdn4.iconfinder.com/data/icons/ios-web-user-interface-multicolor-vol-1/512/Account_Audience_person_customer_profile_user-512.png"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  controller: _fname,
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
                  controller: _lname,
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
                    labelText: "CurrentPassword",
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
                  controller: _password,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "NewPassword",
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
                  controller: _email,
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
                  controller: _nic,
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

            // buildTextField("First Name", "Enter First Name",false),
            // buildTextField("Last Name", "Enter Last Name", false),
            // buildTextField("Current Password", "Enter Current Password",true),
            // buildTextField("New Password", "***", true),
            // buildTextField("Email", "Enter Email",false),
            // buildTextField("NIC", "NIC", false),

            SizedBox(
              height: 35,
            ), //SizeBox
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20)), //RoundedRectangleBorder
                  onPressed: () {
                    SettingsPage();
                  },
                  child: Text("CANCEL",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black)),
                ),
                RaisedButton(
                    color: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      if (_fname.text == '' ||
                          _lname.text == '' ||
                          _password.text == '' ||
                          _nic.text == '' ||
                          _email.text == '') {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Update Failed!!',
                          desc: 'All Fields Required..',
                          btnCancelOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsPage()));
                          },
                          btnOkOnPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsPage()));
                          },
                        )..show();
                      } else {
                        print("Hello   " + id);
                        update(_fname.text, _lname.text, _password.text,
                            _email.text, _nic.text);
                      }
                    }, //RoundRectangleBorder
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
