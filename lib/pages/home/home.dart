import 'package:flutter/material.dart';

import 'package:gestion_d_absence/beans/Attendance.dart';
import 'package:gestion_d_absence/beans/Class.dart';
import 'package:gestion_d_absence/beans/Student.dart';

import 'package:gestion_d_absence/services/dbAttendanceService.dart';
import 'package:gestion_d_absence/services/dbStudentService.dart';
import 'package:gestion_d_absence/services/dbClassService.dart';

import 'package:gestion_d_absence/pages/home/classesList.dart';


import 'package:provider/provider.dart';


class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Student student = new Student(cin: "AAA23", nom: "Dlsf", prenom: "Caerl", class_id: "Genie Electrique 4");
//  Class classIns = new Class(filiere: "Genie Informatique", annee: 4);
  Attendance attendance = new Attendance(date_absence: DateTime.utc(2020, 05 , 21), observation: "");



  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Class>>.value(
      value: DbClassService().getClasses,
      child: Scaffold(
        body: SafeArea(
         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             SizedBox(height: 80.0),
             Expanded(
               flex: 1,
                 child: Container(
                   margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                   color: Colors.grey[800],
                   padding: const EdgeInsets.fromLTRB(9.0, 14.0, 5.0, 38.0),
                   child: Center(
                     child: Text(
                         "Bienvenue a l'application de la gestion des abscences de l'ENSA D'Agadir",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                       ),
                   ),
                 ),
             ),
//              SizedBox(height: 50.0,),

             Expanded(
               flex: 3,
                 child: Container(
                     padding: EdgeInsets.only(top: 25.0),
//                     color: Colors.indigo,
                     child: ClassesList()
                 )
             ),


//              SizedBox(height: 30.0,),
           ],
         ),
        ),
          floatingActionButton : FloatingActionButton(
            backgroundColor: Colors.grey[800],
            onPressed: () async {

//              await DbStudentService(uid: student.cin).updateStudentData(student);
//                 await DbClassService().addClassData(classIns);
//               await DbAttendanceService().addAbsenceToStudent(student, attendance);
//                  await DbAttendanceService().updateAbsence("wKm9aYRf8fljbHv1Be2s", attendance);
            },
            child: Icon(
                Icons.add,

            ),
          )
      ),
    );
  }
}
