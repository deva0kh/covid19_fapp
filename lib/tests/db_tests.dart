

import '../database/DB.dart';
import '../models/patiant.dart';
import 'package:intl/intl.dart';

class DbTesting{
  DB dbhelper = new DB();
  Patient patient ;
String resulta ="";
  void insertTest() async {
    patient = Patient('',0,'',0);
        patient.date = DateFormat.yMMMd().format(DateTime.now());
    patient.seconds=22;

    int result;
    if (patient.id != null) {
    //  result =await dbhelper.update(patient);
       print('nothing');
    } else {
      result = await dbhelper.insert(patient);
      print('inserted');
    }



    if (result != 0) {  // Success
      print( ' \n\n\nSaved Successfully\n\n\n');
   //   print(dbhelper.getList());

      dbhelper.getList();

    } else {  // Failure
      print( '\n\n\nFailed Saving\n\n\n');
    }




  }




}