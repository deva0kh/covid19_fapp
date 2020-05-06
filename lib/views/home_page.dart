import 'package:covid19_test/functions/corana_info.dart';
import 'package:flutter/material.dart';
import 'package:covid19_test/functions/menu.dart';
import 'package:covid19_test/style/global.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[


                Container(

                  padding: EdgeInsets.all(40),
                  constraints: BoxConstraints.expand(height: 225),
                  decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [Colors.blue, Colors.white70],

                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp
                      ),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0), bottomRight:  Radius.circular(30))
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('All you Need is To Stay At home' ,style:casesInfoStyle)
                      ],
                    ),
                  ),
                ),
               // Image.asset("assets/images/covidLogo.jpg")
                Opacity(
                    opacity:0.2,
                    child:

                    Padding(
                      padding: const EdgeInsets.only(left: 0.1),
                      child: Image.asset("assets/images/covidLogo.jpg"),
                    )

                ),
                Container(
                  margin: EdgeInsets.only(top: 120),
                  constraints: BoxConstraints.expand(height:200),
                  child: ListView(
                      padding: EdgeInsets.only(left: 40),
                      scrollDirection: Axis.horizontal,
                      children: CoronaInfo.getCoronaInfos()
                  ),
                ),

                Container(
                  height: 500,
                  margin: EdgeInsets.only(top: 250),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 0,bottom: 30),
                        child: Text(
                          "Menu",

                        ),
                      ),
                      Container(
                        height: 400,
                        child: ListView(
                          children: Menu.getMenu(context),
                        ),
                      ),

                    ],
                  ),
                ),

                Container(
                  color: Colors.cyan.withOpacity(0.85),
                ),

              ],
            ),


          ],
        ),
      ),


    );
  }




}