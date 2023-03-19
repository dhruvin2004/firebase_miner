import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseHelper {
  static DatabaseHelper instance = DatabaseHelper();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference user = FirebaseFirestore.instance.collection('notes');



  updateData(int? index, String title ,String notes) async {
    var docSnap = await user.get();
    var docId = docSnap.docs;

    return user
        .doc(docId[index!].id)
        .update({'title': title, 'note': notes})
        .then((value) => print("Update Successfully"))
        .catchError(
          (error) => print('Error : $error'),
    );
  }

  deleteData({int? index}) async {
    var docSnap = await user.get();
    var docId = docSnap.docs;
    return user
        .doc(docId[index!].id)
        .delete()
        .then((value) => print("Delete Successfully"))
        .catchError(
          (error) => print('Error : $error'),
    );
  }

  insertData(TextEditingController title ,TextEditingController notes) {
    return user
        .add({'title': title.text, 'note': notes.text})
        .then((value) => print("Note Add Successfully"))
        .catchError(
          (error) => print("Error : $error"),
    );
  }
}