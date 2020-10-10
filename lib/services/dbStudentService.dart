import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_d_absence/beans/Class.dart';
import 'package:gestion_d_absence/beans/Student.dart';

class DbStudentService {
  final String uid;
  DbStudentService({this.uid});

  //collection reference
  final CollectionReference studentCollection = Firestore.instance.collection('students');


  Future updateStudentData(Student student) async {
    return await studentCollection.document(uid).setData({
      'nom': student.nom,
      'prenom': student.prenom,
      'uid': student.cin,
      'class_uid' : student.class_id
    });
  }

  List<Student> _studentFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      print('doc data ${doc.data}');
      return Student(
        nom : doc.data['nom'] ?? '',
        prenom: doc.data['prenom'] ?? '',
        cin: doc.data['uid'] ?? '',
        class_id: doc.data['class_uid']
      );
    }).toList();
  }

  Stream<List<Student>> get getStudents {
    return studentCollection.snapshots().map(_studentFromSnapshot);
  }
}