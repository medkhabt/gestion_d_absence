import 'package:flutter/material.dart';
import 'package:gestion_d_absence/beans/Class.dart';
import 'package:gestion_d_absence/beans/Student.dart';

class StudentCard extends StatefulWidget {
  Student _student;
  StudentCard(Student student){
    this._student = student;
  }
  @override
  _StudentCardState createState() => _StudentCardState(_student);
}

class _StudentCardState extends State<StudentCard> {
  Student _student;
  bool _isSwitched = false;

  _StudentCardState(student){
    this._student = student;
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
//          NOT Optimal if we want to use Class Card somewhere else beside home => class
          onLongPress: (){
            Navigator.pushNamed(context, '/student', arguments: _student);
          },
          leading: Icon(Icons.account_circle),
          title: Text('${_student.nom} ${_student.prenom}'),
            trailing: Switch(
              activeColor:  Colors.grey[800],
              value: _isSwitched,
              onChanged : (value) {
                setState(() {
                  _isSwitched = value;
                });
              },
            )
        ),
      ),
    );
  }
}

