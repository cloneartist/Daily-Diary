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
  return
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Card(
      
      child: Column(
        children: [
         
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text(
                  "Date: Time: ",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
             
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "You can't spell america without erica.",
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
              subtitle: Text(
                "Mornings are for coffee and contemplation.",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text(
                  "READ",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
              SizedBox(
                width: 8,
              ),
              TextButton(
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
              SizedBox(
                width: 8,
              )
            ],
          ),
        ],
      ),
      color: Colors.green,
  ),
   );
}
