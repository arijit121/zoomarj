import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:zoom_arj/zoom_arj.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  // final _zoomArjPlugin = ZoomArj();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Plugin example app'),
        // ),
        body: Center(
          child: testbody(
          ),
        ),
      ),
    );
  }
}



class testbody extends StatefulWidget {
  testbody({Key? key})
      : super(key: key);

  @override
  State<testbody> createState() => _testbodyState();
}

class _testbodyState extends State<testbody> {
  TransformationController transformationController =
  TransformationController();
  int pointer = 0;
  double scale = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Zoomarj(
          input_widget: Container(
              width: 120,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Text('Running on:')),
          pinchzoom: 0,
          height: MediaQuery.of(context).size.height-80,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}

