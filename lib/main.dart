import 'package:daily_diary/Screens/diary.dart';
import 'package:daily_diary/Screens/login.dart';
import 'package:daily_diary/Screens/newnote.dart';
import 'package:daily_diary/Screens/note_screen.dart';
import 'package:daily_diary/Screens/reading.dart';
import 'package:daily_diary/Screens/signup.dart';
import 'package:daily_diary/Screens/viewdesc.dart';

// import 'package:daily_diary/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // runApp(MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Daily Diary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const Login(),
      // home: const Reading(),
      // home: const Diary(),
      // home: const NoteScreen(),
    );
  }
}
