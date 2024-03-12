import 'dart:io';

import 'package:firebase_quiz_app/service/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';


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

  //UPLOAD QUIZ FUNCTION
  uploadQuiz() async{
    if(selectedImage!=null && option1controller.text!= '' 
    && option2controller.text!='' && option3controller.text!='' && option4controller.text!='');

    //We need to assign random id using random string pkg
    String addId = randomAlphaNumeric(10);
    //Store the file in firebase
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('blogImages').child(addId);
    //upload the image 
    final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
    //help us to get the url of the image that we will upload to firebase
    var downloadUrl = await (await task).ref.getDownloadURL();

    //so there are many categories so using map dynamic we dont have to do it for every categ.
    //auto uploads the quiz from the each categ from Admin pannel
    Map<String, dynamic> addQuiz={
      "Image":    downloadUrl,
      "option1":  option1controller.text,
      "option2":  option2controller.text,
      "option3":  option3controller.text,
      "option4":  option4controller.text,
      "correct":  correctAnswerController.text,
    };
  
  await DataBaseMethods().addQuizCategory(addQuiz, value!).then((value) =>
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: Colors.orange,
      content: Text("Quiz has been added Successfully",
      style: Theme.of(context).textTheme.bodyMedium,))));

  }

  //LIST OPTIONS DROPDOWN
  String? value;
  final List<String> dropdownQuizOptions = ['Animal', 'Sports', 'Fruits', 'Objects', 'Random', 'Place'];

 //IMAGE PICKER
 final ImagePicker picker = ImagePicker();
 File? selectedImage;

 Future getImage()async{
 var image = await picker.pickImage(source: ImageSource.gallery);

selectedImage = File(image!.path);
setState(() {
  
});
 }


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
                //IF USER PICKS IMAGE
              selectedImage ==null?

                InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: Material(
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
                ):
                //IF IMAGE GET PICKS
                 Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 120,width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        
                        border: Border.all(),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          selectedImage!, fit: BoxFit.fill,),
                      )
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
const SizedBox(height: 20,),

        //Add quiz BUTTON
              SizedBox(width: double.infinity,height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: (){
                    uploadQuiz();
                  },
  child: Text("ADD QUIZ", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),)),
              ),

  const SizedBox(height: 20,),


            
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