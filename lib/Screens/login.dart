// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:daily_diary/Models/shared.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;

  late String email, password;

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
                  SizedBox(height: 80.0),
                  const CircleAvatar(
                    radius: 50,
                     backgroundColor: Colors.blue,

                   ), //Use Diary app logo
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
                    validator: (val) => val!.isEmpty || !(val.contains('@'))
                        ? 'Enter a valid email address'
                        : null,
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Enter Your Email Address',
                    ),
                    onChanged: (value) {},
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
                    onChanged: (value) {},
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
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          //loading = true;
                        });
                        try {
                          // UserCredential user = await FirebaseAuth.instance
                          // .signInWithEmailAndPassword(
                          //     email: email, password: password);
                          // print(user);
                          // Navigator.pushNamed(context, '/home');
                        } catch (e) {
                          // print(e);
                          String error = e.toString();

                          // Navigator.pushNamed(context, '/signup');
                          setState(() {
                            loading = false;
                          });
                          final loginerror = SnackBar(content: Text(error));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(loginerror);
                        }
                      }
                    },
                    label: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        //Navigator.pushNamed((context), '/signup');
                        setState(() {});
                      },
                      child: const Text("New User? Sign Up")),
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
}
