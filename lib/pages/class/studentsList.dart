import 'package:flutter/material.dart';
import 'package:gestion_d_absence/beans/Class.dart';
import 'package:gestion_d_absence/beans/Student.dart';
import 'package:gestion_d_absence/pages/class/studentCard.dart';
import 'package:provider/provider.dart';


class StudentsList extends StatefulWidget {

  Class _classInstance;
  StudentsList(Class c){
    this._classInstance = c;
  }
  @override
  _StudentsListState createState() => _StudentsListState(_classInstance);
}

class _StudentsListState extends State<StudentsList> {

  Class _classInstance;
  _StudentsListState(Class c){
    this._classInstance = c;
  }

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<List<Student>>(context);
//    if(students != null){
//      students.forEach((student) {
//        if(_classInstance.id == student.class_id)
//          print(student.nom);
////      print(student.prenom);
//      });
//    }
    if(students != null) {
      return ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index){
          if(students[index].class_id == _classInstance.id) {
            return StudentCard(students[index]);
          }
          return Container();
        },
      );
    }
    return Container();

  }
}
