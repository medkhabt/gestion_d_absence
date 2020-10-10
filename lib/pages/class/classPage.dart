import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_d_absence/beans/Class.dart';
import 'package:gestion_d_absence/beans/Student.dart';
import 'package:gestion_d_absence/pages/class/studentsList.dart';
import 'package:gestion_d_absence/services/dbStudentService.dart';
import 'package:provider/provider.dart';


class ClassPage extends StatefulWidget {

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {

    final Class classInstance = ModalRoute.of(context).settings.arguments;

    return StreamProvider<List<Student>>.value(
      value:DbStudentService().getStudents,
      child: Scaffold(
//        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          centerTitle: true,
          elevation: 0,
          title: Text('${classInstance.annee} annee ${classInstance.filiere}'),
        ),
        body: StudentsList(classInstance),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
          backgroundColor: Colors.grey[800],

        ),
      ),

    );
  }
}
