
import 'package:flutter/material.dart';
import 'package:covid19_test/models/cards.dart';

class Menu {



  static List<Widget> getMenu(BuildContext context){

    List<String> menuList = ["Status", "Bluetooth", "Ambulance"];
    Map menuIcon = {
      "Status" : Icon(Icons.search, color: Colors.cyan, size: 50,),
      "Bluetooth" : Icon(Icons.bluetooth, color: Colors.cyan, size: 60),
      "Ambulance" : Icon(Icons.healing, color: Colors.redAccent, size: 50),


    };



    List<Widget> menuCards = [];
   List<Widget> rows=[];
    int i = 0;
    for (String menuItem in menuList) {
      if (i < 2) {
        rows.add(Cards.getMenuCard(menuItem,menuIcon,context));
        i ++;
      } else {
        i = 0;
        menuCards.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(Cards.getMenuCard(menuItem,menuIcon,context));
        i++;
      }
    }
    if (rows.length > 0) {
      menuCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return menuCards;



  }




}