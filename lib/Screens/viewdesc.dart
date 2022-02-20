import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  // View({Key? key}) : super(key: key);
  late Map? data;
  late DocumentReference ref;
  View(this.data, this.ref);
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
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
                        delete();
                      },
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0, primary: Colors.black),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.data!['title']}",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Container(
                      child: Text(
                        "${widget.data!['description']}",
                        style: TextStyle(
                            fontSize: 24,
                            // fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void delete() async {
    await widget.ref.delete();

    Navigator.pop(context);
  }
}
