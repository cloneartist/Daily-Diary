// import 'package:firebase_auth/firebase_auth.dart';
import 'package:daily_diary/Screens/login.dart';
import 'package:daily_diary/Screens/note_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:daily_diary/Models/shared.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;

  final _auth = FirebaseAuth.instance;

  late String email, password, name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  // SizedBox(height: 80.0),
                  // const CircleAvatar(
                  //   radius: 50,
                  //   backgroundColor: Colors.blue,

                  // ), //Use Diary app logo
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Welcome To\n Daily Diary",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 50.0),
                  const Spacer(flex: 1),
                  TextFormField(
                    validator: (val) => val!.isEmpty || val.length < 1
                        ? 'Enter your name'
                        : null,
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Enter Your Name',
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    validator: (val) => val!.isEmpty || !(val.contains('@'))
                        ? 'Enter a valid email address'
                        : null,
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Enter Your Email Address',
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    validator: (val) => val!.isEmpty || val.length < 6
                        ? 'Enter a password greater than 6 characters'
                        : null,
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Enter Your Password',
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                  ),

                  const SizedBox(height: 40.0),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    ),
                    icon: const Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 25,
                    ),
                    // padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    onPressed: () async {
                      // print("ji");
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          //loading = true;
                        });
                        try {
                          print("$email+$password");
                          print("ji");
                          UserCredential res =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);

                          User? user = res.user;
                          user!.updateDisplayName(name);

                          print(res);
                          // Navigator.pushNamed(context, '/home');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoteScreen()));
                        } catch (e) {
                          print(e);
                          String error = e.toString();

                          // Navigator.pushNamed(context, '/signup');
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SignUp()));
                          setState(() {
                            // loading = false;
                          });
                          final loginerror = SnackBar(content: Text(error));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(loginerror);
                        }
                      }
                    },
                    label: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        //Navigator.pushNamed((context), '/signup');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                        setState(() {});
                      },
                      child: const Text("Existing User? Login")),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void signIn(String email,String password)async{

  // }
}
