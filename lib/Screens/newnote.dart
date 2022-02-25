import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  var title;
  var description;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.blue,
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0, primary: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        add();
                      },
                      child: Text("Save"),
                      style: ElevatedButton.styleFrom(
                          elevation: 0, primary: Colors.black),
                    )
                  ],
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration:
                            InputDecoration.collapsed(hintText: "Title"),
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                        onChanged: (val) => {title = val, print(title)},
                      ),
                      Container(
                        child: TextFormField(
                          maxLines: 20,
                          decoration:
                              const InputDecoration.collapsed(hintText: "Note"),
                          style: TextStyle(
                              fontSize: 24,
                              // fontWeight: FontWeight.bold,
                              color: Colors.blue),
                          onChanged: (val) =>
                              {description = val, print(description)},
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
