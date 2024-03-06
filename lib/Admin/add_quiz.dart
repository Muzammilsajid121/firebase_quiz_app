import 'package:flutter/material.dart';

class AdminAddQuiz extends StatefulWidget {
  const AdminAddQuiz({super.key});

  @override
  State<AdminAddQuiz> createState() => _AdminAddQuizState();
}

class _AdminAddQuizState extends State<AdminAddQuiz> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Add Quiz",style: Theme.of(context).textTheme.bodyLarge,),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40,),
            Text("Upload New Quiz",style: Theme.of(context).textTheme.bodyLarge,),
        
            //Gallery Option
            const SizedBox(height: 40,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 120,width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  
                  border: Border.all(),
                ),
                child: Icon(Icons.camera),
              ),
            )
        
          ],
        ),
      ),
    );
  }
}