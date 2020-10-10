import 'package:flutter/material.dart';
import 'package:gestion_d_absence/beans/Attendance.dart';
import 'package:gestion_d_absence/beans/Student.dart';
import 'package:gestion_d_absence/pages/student/attendanceCard.dart';
import 'package:provider/provider.dart';

class AttendancesList extends StatefulWidget {
  Student _student;
  AttendancesList(Student student){
    this._student = student;
  }
  @override
  _AttendancesListState createState() => _AttendancesListState(_student);
}

class _AttendancesListState extends State<AttendancesList> {
  Student _student;
  _AttendancesListState(Student student){
    this._student = student;
  }

  @override
  Widget build(BuildContext context) {
    final attendences = Provider.of<List<Attendance>>(context);
      if(attendences != null) {
        attendences.forEach((classInstance) {
          print(classInstance.id);
          print(classInstance.date_absence);
          print(classInstance.observation);
        });
      }

      if(attendences != null) {
        return ListView.builder(
            itemCount: attendences.length,
            itemBuilder: (context, index){
              if(attendences[index].student_id == _student.cin) {

                return AttendanceCard(attendences[index]);

              }
              return Container();
        });
      }
      //TODO if not null, print a message ( "il n'a aucune abscence" )


    return Container();
  }
}

