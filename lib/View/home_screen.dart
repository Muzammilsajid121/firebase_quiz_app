import 'package:firebase_quiz_app/Utils/reusable_quiz_row.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                color: Colors.black
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         CircleAvatar(foregroundImage: AssetImage('images/man.png'),),
                    // SizedBox(width: 0,),
                    Padding(
          padding: const EdgeInsets.only(top: 6.0, right: 40),
        child: Text("Muzammil Sajid",
         style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),),
                      )
                      ],
                    ),

                    //NEXT TO NAME
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Image.asset('images/quiz.png',height: 80,),
                    // SizedBox(width: 30,),
        Padding(
          padding: const EdgeInsets.only(right: 40),
  child: Text("Play Quiz By\nGuessing image", 
  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),),
        ),     
                      ],
                    ),

//                     Center(child: Image.asset('images/quiz.png',height: 80,)),
// Center(child: Text("Play Quiz By Guessing the image", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),)),     
                 ],
                ),
              ),
            ),




            const SizedBox(height: 20,),
            //CATEGORIES
                Text("Top Quiz Category", style: Theme.of(context).textTheme.titleMedium,),  
                const SizedBox(height: 20,),
        
        //REUSABLE ROW FROM UTILS
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReusableQuizRow(firstQuizImage: "images/animals.png", firstQuizTitle: "ANIMALS"),
            ReusableQuizRow(firstQuizImage: "images/countries.png", firstQuizTitle: "COUNTRIES")
          ],
        ),
        const SizedBox(height: 30,),

        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReusableQuizRow(firstQuizImage: "images/fruits.png", firstQuizTitle: "FRUITS"),
            ReusableQuizRow(firstQuizImage: "images/objects.png", firstQuizTitle: "OBJECTS")
          ],
        ),
        const SizedBox(height: 30,),

        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReusableQuizRow(firstQuizImage: "images/places.png", firstQuizTitle: "PLACES"),
            ReusableQuizRow(firstQuizImage: "images/sports.png", firstQuizTitle: "SPORTS")
          ],
        ),
        const SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}

