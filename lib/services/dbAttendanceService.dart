import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_d_absence/beans/Attendance.dart';
import 'package:gestion_d_absence/beans/Student.dart';



class DbAttendanceService {

  DbAttendanceService();

  final CollectionReference attendanceCollection = Firestore.instance.collection('absence');

  Future addAbsenceToStudent(Student student, Attendance attendance) async {
    return await attendanceCollection.add({
      'date_absence' : attendance.date_absence,
      'observation' : (attendance.observation.isEmpty)?('non-justifie'): attendance.observation,
      'student_uid' : student.cin,
    });
  }
//TODO problem in update Absence the student id get deleted.
  Future updateAbsence(String uid, Attendance attendance) async {
    return await attendanceCollection.document(uid).setData({
      'date_absence' : attendance.date_absence,
      'observation' : attendance.observation,

    });
  }

  List<Attendance> _attendanceFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      print('doc data ${doc.data}');
      return Attendance(
        student_id: doc.data['student_uid'],
        date_absence: doc.data['date_absence'].toDate(),
        observation: doc.data['observation'],
        id: doc.documentID
      );
    }).toList();
  }

  Stream<List<Attendance>> get getAttendances {
    return attendanceCollection.snapshots().map(_attendanceFromSnapshot);
  }

  Future <void> deleteAttendance(id) async {
    return await attendanceCollection.document(id).delete().catchError((e){
      print("delete error: $e");
    });
  }
}