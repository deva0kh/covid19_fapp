
import 'package:covid19_test/models/bluetooth.dart';
import 'package:flutter/material.dart';
import 'package:covid19_test/style/global.dart';


class Cards {


  static Widget getMenuCard(String menuItem,Map menuIcon,BuildContext context){


    return new Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 160,
      width: 140,
     // color: Color(0xcce0ff),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(menuItem),
          Container(
            padding: EdgeInsets.only(top: 20),
            height: 100,
            width: 70,
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.white,
              child:  menuIcon[menuItem],
              elevation: 15,
              onPressed: () {
                if(menuItem == "Bluetooth")
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bluetooth()),
                );
              },
            ),
          )
        ],
      ),
    );


  }


 static Widget getCard(int cas,String casString){


    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 20, bottom: 80, top: 70),

      decoration: BoxDecoration(
          color: Colors.white70,
          boxShadow: [
            new BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 20.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[

              Text(casString+ cas.toString(),style :casesInfoStyle

              )
            ],
          ),

        ],
      ),

    );


  }




}