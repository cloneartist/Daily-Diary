import 'package:daily_diary/Screens/newnote.dart';
import 'package:daily_diary/Screens/viewdesc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference ref = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection("notes");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xffF6F6F6),
        automaticallyImplyLeading: false,
        title: Column(
          children: const [
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
                      await FirebaseAuth.instance.signOut();

                      Navigator.pop(context);
                    } catch (e) {
                      String error = e.toString();

                      final loginerror = SnackBar(content: Text(error));
                      ScaffoldMessenger.of(context).showSnackBar(loginerror);
                    }
                  },
                  child: const Icon(Icons.logout),
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
              .push(MaterialPageRoute(builder: (context) => const AddNote()))
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
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
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 2,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ListTile(
                                  title: AutoSizeText(
                                    "${data['title']}",
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 30),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: AutoSizeText(
                                      "${data['description']}",
                                      style:
                                          const TextStyle(color: Colors.blue),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton.icon(
                                    autofocus: false,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.date_range,
                                      color: Colors.black,
                                    ),
                                    label: Text(
                                      date,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  SizedBox(
                                    width: 8,
                                  ),
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
              return const Center(
                child: Text("Loading"),
              );
            }
          }),
    );
  }
}
