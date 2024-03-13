import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_quiz_app/Utils/reusable_quiz_answer.dart';
import 'package:flutter/material.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({super.key});

  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  
  //Stream builderr help us to get all the data in one flow
  //when getting data from firestore use stream builder
  Stream? QuizStream;
  PageController controller = PageController();

  Widget allQuiz(){
    return StreamBuilder(
      stream: QuizStream,
       builder: (context, AsyncSnapshot snapshot){
         return snapshot.hasData? PageView.builder(
          controller: controller,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index){
            DocumentSnapshot documentSnapshot = snapshot.data.docs[index];

          }
         )
       });
  }


  @override
  Widget build(BuildContext context) {
final height = MediaQuery.sizeOf(context).height *1;
final width = MediaQuery.sizeOf(context).width *1;

    return  Scaffold(
      appBar: AppBar(
        title: Text("Category Name",style: Theme.of(context).textTheme.bodyMedium,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: height * 0.4,
               width: width * 0.94,
              child: ClipRRect (borderRadius: BorderRadius.circular(15),
                child: Image.asset('images/ronaldo.jpg',
                fit: BoxFit.cover,
                 )),
            ),
            //
            const SizedBox(height: 20,),
        
            //ReusableQuizAnswer
            ReusableQuizAnswer(quizOption: "Ronaldo"), 
            SizedBox(height: height*0.02,),
            ReusableQuizAnswer(quizOption: "Messi"),
            SizedBox(height: height*0.02,),
            ReusableQuizAnswer(quizOption: "Abrar"),
            SizedBox(height: height*0.02,),
            ReusableQuizAnswer(quizOption: "Leoo"),
        
          ],
        ),
      ),
    );
  }
}