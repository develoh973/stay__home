import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:isolate';

import 'package:get/get.dart';
import 'package:stay__home/controller/LocationController.dart';

class TestPage extends StatefulWidget {
  TestPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TestPageState createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Isolate _isolate;
  bool _running = false;
  static int _counter = 0;
  String notification = "";
  ReceivePort _receivePort;

  var locationcontroller = Get.put(LoactionController());

  void _start() async {
    _running = true;
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_checkTimer, _receivePort.sendPort);
    _receivePort.listen(_handleMessage, onDone: () {
      print("done!");
    });
  }

  static void _checkTimer(SendPort sendPort) async {
    Timer.periodic(new Duration(seconds: 13), (Timer t) async {
      _counter++;
      String msg = 'notification ' + _counter.toString();
      print('SEND: ' + msg);
      sendPort.send(msg);
    });
  }

  void _handleMessage(dynamic data) async {
    Position userLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    locationcontroller.checkLocationParams(
        userLocation.latitude, userLocation.longitude);
    print('RECEIVED: ' + data);
    setState(() {
      notification = data;
    });
  }

  void _stop() {
    if (_isolate != null) {
      setState(() {
        _running = false;
        notification = '';
      });
      _receivePort.close();
      _isolate.kill(priority: Isolate.immediate);
      _isolate = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              notification,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _running ? _stop : _start,
        tooltip: _running ? 'Timer stop' : 'Timer start',
        child: _running ? new Icon(Icons.stop) : new Icon(Icons.play_arrow),
      ),
    );
  }
}
