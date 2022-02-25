import 'package:daily_diary/Screens/newnote.dart';
import 'package:daily_diary/Screens/viewdesc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      appBar: AppBar(
        title: Text("Your diary"),
        actions: [
          Row(
            children: [
              ElevatedButton(
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
                  child: Icon(Icons.logout))
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
                      child: Card(
                        color: Colors.lightBlue,
                        child: Column(
                          children: [
                            Text(
                              "${data['title']}",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "$dt",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            )
                          ],
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
