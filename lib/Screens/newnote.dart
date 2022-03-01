import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String title = "";
  String description = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0, primary: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        add();
                      },
                      child: const Text("Save"),
                      style: ElevatedButton.styleFrom(
                          elevation: 1,
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ],
                ),
                Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                        child: TextFormField(
                          decoration: const InputDecoration.collapsed(
                              hintText: "Enter Title"),
                          style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          onChanged: (val) => {
                            title = val,
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                        child: TextFormField(
                          maxLines: 20,
                          decoration: const InputDecoration.collapsed(
                              hintText: "What's on your mind?"),
                          style:
                              const TextStyle(fontSize: 24, color: Colors.blue),
                          onChanged: (val) => {description = val},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void add() async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("notes");

    var data = {
      "title": title,
      "description": description,
      "time": DateTime.now()
    };
    ref.add(data);

    Navigator.pop(context);
  }
}
