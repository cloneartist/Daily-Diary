import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class View extends StatefulWidget {
  // View({Key? key}) : super(key: key);
  final Map? data;
  final DocumentReference ref;
  const View(this.data, this.ref, {Key? key}) : super(key: key);
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
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
                        delete();
                      },
                      child: const Icon(
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                          child: Text(
                            "${widget.data!['title']}",
                            style: const TextStyle(
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
                            style: const TextStyle(
                                fontSize: 24, color: Colors.blue),
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

  void upd(var dex, var titlex) async {
    await widget.ref.update({description: dex, title: titlex});

    Navigator.pop(context);
  }
}
