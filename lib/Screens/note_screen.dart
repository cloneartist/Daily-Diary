import 'package:daily_diary/Screens/newnote.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
  // late final User user;
}

class _NoteScreenState extends State<NoteScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    // var name = user!.displayName;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddNote()));
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                // "Hey There $name ",
                "name",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  print(user);
                  try {
                    // print(FirebaseAuth.instance.currentUser);
                    await FirebaseAuth.instance.signOut();

                    Navigator.pop(context);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("LOGOUT"))
          ],
        ));
  }
}
