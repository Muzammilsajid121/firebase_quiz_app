import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_quiz_app/Admin/add_quiz.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80,),
              Text("ADMIN PANNEL", style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 35),),
              const SizedBox(height: 10,),
          
              Image.asset('images/admin.png',height: 100,),
              const SizedBox(height: 70,),
          
          
          //1st FORM
              TextFormField(
                controller: userNameController,
                validator: (value) {
                  if(value ==null || value.isEmpty){
                    return "Please Enter Username";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter User Name", style: Theme.of(context).textTheme.bodyMedium,),
                  // hintText: "Enter User Name", 
          
                ),
              ),
             const SizedBox(height: 35,),

               //2nd FORM
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if(value ==null || value.isEmpty){
                    return "Please Enter Password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Password", style: Theme.of(context).textTheme.bodyMedium,),
                  // hintText: "Enter User Name", 
                ),
              ),
              const SizedBox(height: 20,),
               
               //LOGIN BUTTON
              SizedBox(width: double.infinity,height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: (){
                    LoginAdmin();
                  },
             child: Text("Login", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),)),
              )
          
          
          ],),
        ),
      ),
    );
  }
  LoginAdmin(){
    FirebaseFirestore.instance.collection("AdminMuzammil").get().then((snapshot) {
    snapshot.docs.forEach((result) { 
      if(result.data()['username'] != userNameController.text.trim()){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
         Text("Enter correct username",style: Theme.of(context).textTheme.bodyMedium,)));
      }
      //else if
      else if(result.data()['password'] != passwordController.text.trim()){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
         Text("Enter correct password",style: Theme.of(context).textTheme.bodyMedium,)));
      }

      //else move to add quiz 
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminAddQuiz()));
      }

      }
      //else
    );
    });
  }
  }