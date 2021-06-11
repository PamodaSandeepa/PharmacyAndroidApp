import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:parmacy/api-services/Connection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'CustomerPart.dart';
import 'package:http_parser/http_parser.dart';

class AddOrder extends StatefulWidget {
  AddOrder() : super();
  @override
  _AddOrderState createState() => _AddOrderState();
}

var id, fname, lname, customer, conP, pname, pcity;

class _AddOrderState extends State<AddOrder> {
  void initState() {
    super.initState();
    user();
    super.initState();
  }

  user() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("pharmacyId");
    conP = prefs.getString("pharmacyCon");
    pname = prefs.getString("pharmacyName");
    pcity = prefs.getString("pharmacyCity");
    fname = prefs.getString("fname");
    lname = prefs.getString("lname");
    customer = prefs.getString("cid");
    setState(() {});
  }

  Future<File> imageFile;

  Future<void> orderMake(fname, lname, address, email, contact, pcon, pName,
      pCity, imgName) async {
    var ip = Configuration.base_url;

    final dio = Dio();

    dio.options.headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(pathImg,
          filename: imgName, contentType: MediaType("image", "jpg"))
    }); // 'file' - this is an api key, can be different

    final response1 = await dio.post(
      // or dio.post
      "$ip/file/upload/",
      data: formData,
    );

    print(response1);

    var url = "$ip/precription/AddPrecription/"; //
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fname': fname,
        'lname': lname,
        'address': address,
        'email': email,
        'phone': contact,
        'pid': id,
        'cid': customer,
        'pcontact': pcon,
        'image': response1.toString(),
        'pname': pName,
        'pcity': pCity
      }),
    );

    /*
    FormData formData = new FormData.from({
      "name": "file",
      "file1": new UploadFileInfo(__image, imgName)
    });
    final response1 = await dioRequest.post("/info", data: formData);
   */
    print(customer);
    var parse = response.statusCode;

    if (parse == 200) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.BOTTOMSLIDE,
        title: 'CustomerPart  Success!!',
        desc: 'Thanks..',
        btnOkOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CustomerPart()));
        },
      )..show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Order Failed!!',
        desc: "Something Goes Wrong",
        btnCancelOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CustomerPart()));
        },
        btnOkOnPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CustomerPart()));
        },
      )..show();
    }
  }

  //-------------------presciption uploading

  File __image;
  Path path;
  String pathImg = "";
  String imgName = "";

  Future getPic() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      __image = image;
      print('Image Path $__image');
      pathImg = __image.path;
      print(pathImg);
      imgName = pathImg.split("/").last;
      print(imgName);
    });
  }

  //-------------------------------
  String address = "231", mail = "pd@gmail.com", contact = "";
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'MAKE MY ORDER ',
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
                    labelText: "First name - " + fname,
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
                  decoration: InputDecoration(
                    enabled: false,
                    labelText: "Last name - " + lname,
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
                  decoration: InputDecoration(
                    labelText: 'BILLING ADDRESS',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onChanged: (value) {
                    address = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onChanged: (value) {
                    mail = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'CONTACT',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onChanged: (value) {
                    contact = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "ADD A PRESCRIPTION",
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                        IconButton(
                            icon: Icon(Icons.image),
                            onPressed: () {
                              getPic();
                            }),
                      ],
                    ),
                    ClipRect(
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          widthFactor: 1.0,
                          heightFactor: 0.5,
                          child: __image != null ? Image.file(__image) : null,
                        ),
                      ),
                    ),
                    /*      GFAvatar(
                        size: 80.0,
                        backgroundImage:
                            __image != null ? FileImage(__image) : null,
                        shape: GFAvatarShape.square),   */
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 50.0,
                width: 150.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.deepOrange,
                  child: GestureDetector(
                    onTap: () {
                      orderMake(fname, lname, address, mail, contact, conP,
                          pname, pcity, imgName);
                    },
                    child: Center(
                      child: Text(
                        'Make My Order',
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
