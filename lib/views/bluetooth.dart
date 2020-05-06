

import 'package:covid19_test/models/patiant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
import 'package:intl/intl.dart';
import '../database/DB.dart';


class Bluetooth extends StatefulWidget {
  @override
  _BluetoothState createState() => new _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  String _data = '';
  String _isConnected = '';
  bool _scanning = false;
  FlutterScanBluetooth _bluetooth = FlutterScanBluetooth();
DB dbhelper = new DB();
  @override
  void initState() {
    super.initState();

    _bluetooth.devices.listen((device) {
      setState(() async {
        _data += device.name+' (${device.address})\n';
        //inserting data into sql
       Patient patient = Patient('${device.address}',0,'',0);
        patient.date = DateFormat.yMMMd().format(DateTime.now());
        int result;
        if (patient.id != null) {
          //  result =await dbhelper.update(patient);
          print('nothing');
        } else {
          result = await dbhelper.insert(patient);
          print('inserted');
        }
      //  connect(device.address);

      });
    });
    _bluetooth.scanStopped.listen((device) {
      setState(() {
        _scanning = false;
        _data += 'scan stopped\n';
      });
    });
  }
//  BluetoothConnection connection;
//
// void connect(String address) async {
//    try {
//      connection = await BluetoothConnection.toAddress(address);
//      print('Connected to the device');
//      _isConnected="is connected";
//
//      connection.input.listen((Uint8List data) {
//        //Data entry point
//        print(ascii.decode(data));
//      });
//
//    } catch (exception) {
//      print('Cannot connect, exception occured');
//      _isConnected="not connected";
//    }
//  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('BluetoothCheck'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(child: Text(_data + "  "+ _isConnected)

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: RaisedButton(child: Text(_scanning ? 'Stop scan' : 'Start scan'), onPressed: () async {
                  try {
                    if(_scanning) {
                      await _bluetooth.stopScan();
                      debugPrint("scanning stoped");
                      setState(() {
                        _data = '';
                      });
                    }
                    else {
                      await _bluetooth.startScan(pairedDevices: false);
                      debugPrint("scanning started");
                      setState(() {
                        _scanning = true;
                      });
                    }
                  } on PlatformException catch (e) {
                    debugPrint(e.toString());
                  }
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}