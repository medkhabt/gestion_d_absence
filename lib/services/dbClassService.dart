import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_d_absence/beans/Class.dart';



class DbClassService {
  final CollectionReference classCollection = Firestore.instance.collection('classes');

  DbClassService();

  Future addClassData(Class classInstance) async {
    return await classCollection.document(classInstance.id).setData({
      'filiere' : classInstance.filiere,
      'annee' : classInstance.annee,
      'uid' : classInstance.id
    });
  }

  // Get Classes Stream
  List<Class> _classFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Class(
        annee: doc.data['annee'] ?? 0,
        filiere: doc.data['filiere'] ?? '',
      );
    }).toList();
  }

  Stream<List<Class>> get getClasses {
    return classCollection.snapshots().map(_classFromSnapshot);
  }

}