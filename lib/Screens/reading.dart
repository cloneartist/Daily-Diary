import 'package:flutter/material.dart';

class Reading extends StatelessWidget {
  const Reading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('What we know is a drop, what we don\'t know is an ocean'),
      ),
      body: Container(
        child: Cardwidget(),
      ),
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

        child: ListView(
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                TextButton(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                    child: Text(
                      "Date: Time: ",
                      style: TextStyle(color: Colors.pink[600],fontSize: 20),
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                subtitle: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Text(
                    """It’s been six months since the Battle of Starcourt, which brought terror and destruction to Hawkins. Struggling with the aftermath, our group of friends are separated for the first time – and navigating the complexities of high school hasn't made things any easier. In this most vulnerable time, a new and horrifying supernatural threat surfaces, presenting a gruesome mystery that, if solved, might finally put an end to the horrors of the Upside Down.

Since its release in 2016, the global phenomenon Stranger Things has garnered over 65 award wins and 175 award nominations, with Season 3 amassing 582 million view hours ranking as the second most popular English-language series in the Netflix Top 10, and Season 2 accounting for 427 million view hours ranking at #10. Stranger Things was created by The Duffer Brothers . The Duffer Brothers serve as executive producers on the series.

LOST

The show starts with a crashed jet on a deserted island. The survivors find the island is not so deserted and one of many mystery. On its surface, it is simply a scripted version of Survivor, the popular TV reality show. But as it develops, it shows itself to be much much more. The vast and varied cast is led by TV veteran Matthew Fox. They form a great family group of many individual skills. Their chemistry is truly compelling.

""",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
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
