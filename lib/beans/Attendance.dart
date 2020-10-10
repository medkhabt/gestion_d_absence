import 'package:flutter/material.dart';

class Attendance {
  String id;
  DateTime date_absence;
  String observation;
  String student_id;

  Attendance({this.id, this.student_id, this.date_absence, this.observation});
//  Attendance.forFilling({this.date_absence, this.observation, this.student_id, this.id});
}