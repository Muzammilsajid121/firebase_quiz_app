import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DataBaseMethods{

  Future addQuizCategory(Map<String, dynamic> userQuizCategory, String category) async{
    return FirebaseFirestore.instance.collection(category).add(userQuizCategory);
  }

 //querysnapshot help us to get all the data from firestore database
  Future <Stream<QuerySnapshot>> getCategoryQuiz(String category) async{
    return FirebaseFirestore.instance.collection(category).snapshots();
  }


}