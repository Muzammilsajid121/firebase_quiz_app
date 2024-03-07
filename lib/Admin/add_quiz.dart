import 'package:flutter/material.dart';

class AdminAddQuiz extends StatefulWidget {
  const AdminAddQuiz({super.key});

  @override
  State<AdminAddQuiz> createState() => _AdminAddQuizState();
}

class _AdminAddQuizState extends State<AdminAddQuiz> {
  //OPTIONS CONTROLLERS 
  TextEditingController option1controller = new TextEditingController();
  TextEditingController option2controller = new TextEditingController();
  TextEditingController option3controller = new TextEditingController();
  TextEditingController option4controller = new TextEditingController();
  TextEditingController correctAnswerController = new TextEditingController();

  //LIST OPTIONS DROPDOWN
  String? value;
  final List<String> dropdownQuizOptions = ['Animal', 'Sports', 'Fruits', 'Objects', 'Random', 'Place'];


  //

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Add Quiz",style: Theme.of(context).textTheme.bodyLarge,),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Gallery Option
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
                ),

       const SizedBox(height: 20,),
              //FROM ReusableQuizOptionAmin  
              //REUSABLE
               // QUIZ OPTION 1
                ReusableQuizOptionAmin(
                 textEditingController: option1controller,
                   hintText: 'Enter Option 1',  ),
                   const SizedBox(height: 20,),
            
               // QUIZ OPTION 2
                ReusableQuizOptionAmin(
                 textEditingController: option2controller,
                   hintText: 'Enter Option 2',  ),
                   const SizedBox(height: 20,),
              
               // QUIZ OPTION 3
                ReusableQuizOptionAmin(
                 textEditingController: option3controller,
                   hintText: 'Enter Option 3',  ),
                   const SizedBox(height: 20,),
            
               // QUIZ OPTION 4
                ReusableQuizOptionAmin(
                 textEditingController: option4controller,
                   hintText: 'Enter Option 4',  ),
                   const SizedBox(height: 20,),
            
               // CORRECT ANSWER
                ReusableQuizOptionAmin(
                 textEditingController: correctAnswerController,
                   hintText: 'Enter Correct Answer',  ),
                   const SizedBox(height: 20,),
            
 //DROP DOWN BUTTON
   Container(
    width: double.infinity,
     decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 183, 207, 250),
      ),
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 12.0),
       child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: dropdownQuizOptions.map((item) => 
          DropdownMenuItem(value: item, 
          child: Text(item, style: Theme.of(context).textTheme.bodyMedium,),)).toList(),
          onChanged: (value)=>setState(() {
            this.value=value;
          }),
          hint: Text("Select Category",style: Theme.of(context).textTheme.bodyMedium,),
          iconSize: 36,
          value: value,
          ),

          ),
     ), )  ,
//DROPDOWN END         
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ReusableQuizOptionAmin extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;

  ReusableQuizOptionAmin({
    required this.textEditingController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 183, 207, 250),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextFormField(
          controller: textEditingController,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}