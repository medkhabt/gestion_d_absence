import 'package:flutter/material.dart';
import 'package:gestion_d_absence/pages/class/classPage.dart';
import 'package:gestion_d_absence/pages/home/home.dart';
import 'package:gestion_d_absence/pages/student/studentPage.dart';
import 'package:gestion_d_absence/shared/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/class' : (context) => ClassPage(),
    '/student' : (context) => StudentPage(),
  }
));
