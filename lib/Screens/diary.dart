import 'package:flutter/material.dart';

class Diary extends StatelessWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diary App'),
      ),
      body: ListView(children: [
        Cardwidget(),
        Cardwidget(),
        Cardwidget(),
        Cardwidget(),
        Cardwidget(),
        Cardwidget(),
        Cardwidget(),
        Cardwidget(),
        Cardwidget(),
        Cardwidget(),
      ]),
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
    );
  }
}

Widget Cardwidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: .5,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.date_range,
                    color: Colors.green,
                  ),
                  label: Text(
                    "Date: & Time: ",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  "You can't spell america without erica.",
                  style: TextStyle(color: Colors.pink, fontSize: 18),
                ),
                subtitle: Text(
                  "Mornings are for coffee and contemplation.",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    "Add to Fav",
                    style: TextStyle(color: Colors.red),
                  ),
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
               TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.blue,
                  ),
                  label: Text(
                    "Delete",
                    style: TextStyle(color: Colors.blue),
                  ),
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
}
