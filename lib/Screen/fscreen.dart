import 'package:flutter/material.dart';

import 'landingpage.dart';

// import 'Login.dart';


class FScreenPage extends StatefulWidget {
 FScreenPage({Key key }) : super(key: key);

 

 

  @override
  _FScreenPageState createState() => _FScreenPageState();
}

class _FScreenPageState extends State<FScreenPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Future.delayed(Duration(seconds: 3),
     (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>  LandingPage()));
     }
    );
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      

      body:
      SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width:  MediaQuery.of(context).size.width ,
                color: Color(0xffFFE082),
          // decoration: BoxDecoration(
          //         gradient:LinearGradient(colors: <Color>[
                    
          //           Color(0xffFFE082),
          //           Color(0xff795548),

          //         ])
          //       ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 90),
              Container(
                child:  Image.asset('assets/images/epharmacy_logo.jpg'),
                width: 300,

              ),
              
            ],
          ),

          ),
      ),

    );
  }
}
