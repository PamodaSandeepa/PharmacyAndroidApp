import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parmacy/api-services/Connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fscreen.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  Future<String>  addMessage(name, email,  message) async {
    var ip = Configuration.base_url;
    print(name);
    var url = "$ip/contact/AddMessage"; //base url + end point
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'message': message
      }),
    );



    var parse =response.statusCode;
    if(parse == 201 || parse == 200 ){
      print(parse);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Send Success!!',
        desc: 'Thank you for your feedback..',
        btnCancelOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContactPage()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FScreenPage()));
        },
      )..show();
    }
    else{
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Send Failed!!',
        desc: 'Something went wrong..',
        btnCancelOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContactPage()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContactPage()));
        },
      )..show();
    }

  }

  @override
  Widget build(BuildContext context) {
    var name, email,message;
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          color: Colors.grey,
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
                child: Image(image: AssetImage('assets/images/contact_us.png')),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    hintText: 'John Doe',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onChanged: (value){
                    name = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'johndoe@gmail.com',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onChanged: (value){
                    email = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 0.0),
                child: TextField(
                  maxLines: 8,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Write your status here',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onChanged: (value){
                    message = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 22.0),
                height: 50.0,
                width: 150.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green,
                  child: GestureDetector(
                    onTap: () {
                      if(name == null || email == null || message == null)
                        {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Send Failed!!',
                            desc: 'All Fields Required..',
                            btnCancelOnPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ContactPage()));
                            },
                            btnOkOnPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ContactPage()));
                            },
                          )..show();
                        }
                      else{
                        addMessage(name, email, message);
                      }

                    },
                    child: Center(
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25.0),
                alignment: Alignment.topCenter,
                child: Text(
                  'Hotline : 076 4720883',
                  style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                alignment: Alignment.topCenter,
                child: Text(
                  'Email : epharmacy1507@gmail.com',
                  style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
