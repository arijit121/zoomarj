# zoom_arj

A new Flutter project.

## Getting Started

import zoom_arj dependency

import 'package:zoom_arj/zoom_arj.dart';

Example:

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
    pinchzoom: 0, /// for pinchzoom give input 1
    height: MediaQuery.of(context).size.height-80,
    width: MediaQuery.of(context).size.width,
)
