import 'package:flutter/material.dart';

class ReusableQuizAnswer extends StatelessWidget {
  final String quizOption;
  const ReusableQuizAnswer({super.key, required this.quizOption});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height *1;
    return  Container(
      height: height*0.07, width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
        // color: Colors.limeAccent
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(quizOption),
      ),
    );
  }
}