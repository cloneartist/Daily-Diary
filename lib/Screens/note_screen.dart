import 'package:daily_diary/Screens/newnote.dart';
import 'package:daily_diary/Screens/viewdesc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
  // late final User user;
}

class _NoteScreenState extends State<NoteScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference ref = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("notes");
  Widget build(BuildContext context) {
    // var name = user!.displayName;
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffF6F6F6),
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            AutoSizeText(
              "Your Diary",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      // print(FirebaseAuth.instance.currentUser);
                      await FirebaseAuth.instance.signOut();

                      Navigator.pop(context);
                    } catch (e) {
                      print(e);
                    }
                    //         },
                  },
                  child: Icon(Icons.logout),
                  style: ElevatedButton.styleFrom(
                      elevation: 1,
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNote()))
              .then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Map? data = snapshot.data!.docs[index].data() as Map;
                    DateTime dt = data['time'].toDate();
                    var date = DateFormat.yMMMMd().add_jm().format(dt);
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => View(
                                data, snapshot.data!.docs[index].reference),
                          ),
                        )
                            .then((value) {
                          setState(() {});
                        });
                      },
                      // child: Card(
                      //   color: Colors.lightBlue,
                      //   child: Column(
                      //     children: [
                      //       Text(
                      //         "${data['title']}",
                      //         style: TextStyle(
                      //             fontSize: 32,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.white),
                      //       ),
                      //       Container(
                      //         alignment: Alignment.bottomRight,
                      //         child: Text(
                      //           "$dt",
                      //           style: TextStyle(
                      //               fontSize: 20, color: Colors.white),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListTile(
                                  title: AutoSizeText(
                                    "${data['title']}",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 30),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: AutoSizeText(
                                      "${data['description']}",
                                      style: TextStyle(color: Colors.blue),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.all(8.0),
                              //       child: RichText(
                              //         text: TextSpan(
                              //           children: [
                              //             WidgetSpan(
                              //               child: Center(
                              //                   child: Icon(Icons.date_range,
                              //                       size: 16)),
                              //             ),
                              //             TextSpan(
                              //               text: " $date",
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton.icon(
                                    autofocus: false,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.date_range,
                                      color: Colors.black,
                                    ),
                                    label: Text(
                                      date,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // TextButton.icon(
                                  //   onPressed: () {},
                                  //   label: Text(
                                  //     "Add to Fav",
                                  //     style: TextStyle(color: Colors.red),
                                  //   ),
                                  //   icon: Icon(
                                  //     Icons.favorite_border_outlined,
                                  //     color: Colors.red,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  // TextButton.icon(
                                  //   onPressed: () {},
                                  //   icon: Icon(
                                  //     Icons.delete,
                                  //     color: Colors.blue,
                                  //   ),
                                  //   label: Text(
                                  //     "Delete",
                                  //     style: TextStyle(color: Colors.blue),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 8,
                                  )
                                ],
                              ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text("Loading"),
              );
            }
          }),
      //
      // Column(
      //   // mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: Text(
      //         // "Hey There $name ",
      //         "name",
      //         style: TextStyle(color: Colors.black),
      //       ),
      //     ),

      //     ElevatedButton(
      //         onPressed: () async {
      //           print(user);
      //           try {
      //             // print(FirebaseAuth.instance.currentUser);
      //             await FirebaseAuth.instance.signOut();

      //             Navigator.pop(context);
      //           } catch (e) {
      //             print(e);
      //           }
      //         },
      //         child: Text("LOGOUT"))
      //   ],

      // )
    );
  }
}
