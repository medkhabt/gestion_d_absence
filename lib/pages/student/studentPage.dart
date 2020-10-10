import 'package:flutter/material.dart';
import 'package:gestion_d_absence/beans/Attendance.dart';
import 'package:gestion_d_absence/beans/Student.dart';
import 'package:gestion_d_absence/pages/student/attendancesList.dart';
import 'package:gestion_d_absence/services/dbAttendanceService.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {


  @override
  Widget build(BuildContext context) {
    final Student student = ModalRoute.of(context).settings.arguments;

    return StreamProvider<List<Attendance>>.value(
      value: DbAttendanceService().getAttendances,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          elevation: 0,
          title: Text('Resume d\'absence'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                 Expanded(
                   flex: 1,
                   child: Container(
                     margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
//                     padding: const EdgeInsets.symmetric(vertical: 10.0),
                     decoration: BoxDecoration(
                         color: Colors.grey[700],
                       border: Border.all(),
                       borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
//                    color: Colors.blue[900],
//                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),

                        Expanded(
                          flex: 9,
                          child: Container(
//                            color: Colors.indigo[100],
                            child: Text(
                              "${student.nom} ${student.prenom}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: AssetImage('assets/images/Female_Profil.jpg'),
                            )

                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Container(),
                        )
                      ],
                    ),
                ),
                 ),

              Expanded(
                flex: 3,
                child: Container(
                    child: AttendancesList(student)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
