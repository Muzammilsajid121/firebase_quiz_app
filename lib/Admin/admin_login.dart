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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Admin's Place",),

          TextFormField(
            controller: userNameController,
            validator: (value) {
              if(value ==null || value.isEmpty){
                return "Please Enter Username";
              }
            },
            decoration: InputDecoration(
              label: Text("Enter User Name"),
              hintText: "Enter User Name",

            ),
          )


      ],),
    );
  }
}