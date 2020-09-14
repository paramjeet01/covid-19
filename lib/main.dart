import 'package:flutter/material.dart';
import 'package:test_covid/services/contact_show.dart';
import 'package:test_covid/services/graph_show.dart';
import 'package:test_covid/services/notification_show.dart';
import 'package:test_covid/services/hospital_show.dart';
import 'package:test_covid/services/medical_show.dart';
import 'package:test_covid/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/locations' : (context) => jsonparse(),
    '/notification' : (context) => notification(),
    '/hospital' : (context) => hospital(),
    '/medical' : (context) => medical(),
    '/graph' : (context) => graph(),
  },

));


