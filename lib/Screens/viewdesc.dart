import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class View extends StatefulWidget {
  // View({Key? key}) : super(key: key);
  late Map? data;
  late DocumentReference ref;
  View(this.data, this.ref, {Key? key}) : super(key: key);
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
                        color: Colors.black,
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
                          elevation: 1,
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ],
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                          child: Text(
                            "${widget.data!['title']}",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                          child: Text(
                            "${widget.data!['description']}",
                            style: TextStyle(
                                fontSize: 24,
                                // fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      ],
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
