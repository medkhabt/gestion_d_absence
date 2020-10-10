import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_d_absence/beans/Attendance.dart';
import 'package:gestion_d_absence/services/dbAttendanceService.dart';

import 'package:intl/intl.dart';



class AttendanceCard extends StatefulWidget {
  Attendance _attendance;
  AttendanceCard(Attendance attendance){
    this._attendance = attendance;
  }
  @override
  _AttendanceCardState createState() => _AttendanceCardState(_attendance);
}

class _AttendanceCardState extends State<AttendanceCard> {

  Attendance _attendance;

  _AttendanceCardState(Attendance attendance){
    this._attendance = attendance;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
//          NOT Optimal if we want to use Class Card somewhere else beside home => class
//            onLongPress: (){
//              Navigator.pushNamed(context, '/student', arguments: _student);
//            },
//            leading: Icon(Icons.account_circle),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 5,
                  child: Container(
                      child: Text('${new DateFormat("dd-MM-yyyy").format(_attendance.date_absence)}')
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                      child: Text('${_attendance.observation}')
                  ),
                ),
              ],
            ),
            trailing: GestureDetector(
              onTap: (){
                print(_attendance);
                print('inside delete, id: ${_attendance.id}');
                DbAttendanceService().deleteAttendance(_attendance.id);
              }
              ,
              child: Icon(
                Icons.delete, color: Colors.red[800],
              ),
            )
        ),
      ),
    );
  }
}
