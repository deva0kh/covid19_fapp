import 'package:covid19_test/models/case_ma.dart';
import 'package:flutter/material.dart';
import 'package:covid19_test/functions/cards.dart';

class CoronaInfo {

 static List<Widget> getCoronaInfos(){

    List<Widget> infoCards = [];
    CaseMaroc cas = new CaseMaroc(100, 10, 3);
    infoCards.add(Cards.getCard(cas.cases, "Cases:"));
    infoCards.add(Cards.getCard(cas.deaths, "Deaths: "));
    infoCards.add(Cards.getCard(cas.recovered,"Recovered: "));
    return infoCards;

  }




}