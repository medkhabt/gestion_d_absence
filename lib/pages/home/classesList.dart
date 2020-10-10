import 'package:flutter/material.dart';
import 'package:gestion_d_absence/beans/Class.dart';
import 'package:provider/provider.dart';

import 'classCard.dart';

class ClassesList extends StatefulWidget {

  @override
  _ClassesListState createState() => _ClassesListState();
}

class _ClassesListState extends State<ClassesList> {

  @override
  Widget build(BuildContext context) {
    final classes = Provider.of<List<Class>>(context);
//    print(classes);
//    print(classes.documents);
//    classes.forEach((classInstance) {
//      print(classInstance.filiere);
//      print(classInstance.annee);
//    });
    if(classes != null) {
      return ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index){
          return ClassCard(classInstance: classes[index]);
        },
      );
    }

    return Container();

  }
}
