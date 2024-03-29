import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_quiz_app/Admin/add_quiz.dart';
import 'package:firebase_quiz_app/Admin/admin_login.dart';
import 'package:firebase_quiz_app/View/home_screen.dart';
import 'package:firebase_quiz_app/View/question.dart';
import 'package:firebase_quiz_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 235, 233, 233),

         //TEXT THEMES
        textTheme: TextTheme(
            //Body Small
            bodySmall:
                GoogleFonts.poppins(fontSize: 11,fontWeight: FontWeight.w600, color: Colors.black),
                //
                displaySmall:
                 GoogleFonts.poppins(fontSize: 13,fontWeight: FontWeight.w500, color: Colors.black),
            //Body Medium
            bodyMedium: GoogleFonts.poppins(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
            //
            //Body Large; choosen by theme
            bodyLarge: GoogleFonts.aBeeZee(fontSize: 19,  fontWeight: FontWeight.w700, color: Colors.black),
            // //
            titleMedium: GoogleFonts.poppins(fontSize: 26, color: Colors.black , fontWeight: FontWeight.bold),
        ),
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const AdminAddQuiz(),
    );
  }
}

