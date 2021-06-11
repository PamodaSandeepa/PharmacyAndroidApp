import 'package:flutter/material.dart';
class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold
      (
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
        child: Column(
          children: [
            Stack(children: [
              Image
                (image: NetworkImage("https://pharmacytimes.s3.amazonaws.com/v1_media/Fotolia_132398971_Subscription_XXL.jpg")),
              Opacity(
                  opacity: 0.3,
                  child: Container(
                    margin: EdgeInsets.only(top: 150.0),
                    height: 50.0,
                    width: 170.0,
                    color: Colors.black,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 160.0, left: 10.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "ABOUT US",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        fontSize: 30.0),
                  )),
            ]),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              alignment: Alignment.topLeft,
              child: Text(
                'ePharmacy - Pharmacy Management System is a very convenient, flexible to use. It is specially designed to fulfill the medical requirements of the people. As per security measures, we woukld like to get some of your personal information. Hopefully, you can get a quick service from this system. So you can join with us and get the maximum advantage. You have to do a very small thing. First of all, if someone wants to buy their medicines through a system like this, He/She shoul access this system and find the nearest pharmacy by using the googke maps. And then they shall send their prescription to that selected pharmacy. Then they will calculate the amount for those medicines and send back to the customers. So that, after the payment done through this system, the pharmacy will be delivered the medicines which they chose.',
                style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.topLeft,
              child: Text(
                'The Mission',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              alignment: Alignment.topLeft,
              child: Text(
                'We strive to develop the most useful and practical fully integrated healthcare pharmacy information system, which is also open-source software, allowing other developers to modify, or develop it future as per the needs.',
                style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.topLeft,
              child: Text(
                'The Technology',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              alignment: Alignment.topLeft,
              child: Text(
                'The project development is comprised of several components, each having important and specific roles, and supported by a solid infrastructure.',
                style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}