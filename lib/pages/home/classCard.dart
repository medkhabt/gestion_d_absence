import 'package:flutter/material.dart';
import 'package:gestion_d_absence/beans/Class.dart';

class ClassCard extends StatelessWidget {

  final Class classInstance ;

  ClassCard({this.classInstance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        color: Colors.white70,
        child: ListTile(
//          NOT Optimal if we want to use Class Card somewhere else beside home => class
            onTap: (){
             Navigator.pushNamed(context, '/class', arguments: classInstance);
             },
            leading: Icon(
                Icons.class_,
                color: Colors.grey[800],
            ),
            title: Text('${classInstance.annee} annee ${classInstance.filiere}'),
//            trailing: Icon(Icons.more_vert)
        ),
      ),
    );
  }
}
