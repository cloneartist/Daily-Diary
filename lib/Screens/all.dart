import 'package:flutter/material.dart';

class All extends StatelessWidget {
  const All({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children:  [
       
        Card(
  

          child: Column(
            children: [
            
              ListTile(
                
                
                title: Text("You can't spell america without erica.", style: TextStyle(color: Colors.white),),
                subtitle: Text("Mornings are for coffee and contemplation.", style: TextStyle(color: Colors.white),),
              ),
                    Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                TextButton(
                                child:Text("READ",style: TextStyle(color: Colors.white),),
                                onPressed: ()
                                {},
                              ),
                              SizedBox(width: 8,),
                              TextButton(
                                child: Text("EDIT",style: TextStyle(color: Colors.white),),
                                onPressed: (){},
                              ),
                              SizedBox(width: 8,),
                              TextButton(
                                child: Text("Delete",style: TextStyle(color: Colors.white),),
                                onPressed: (){},
                              ),
                              SizedBox(width: 8,)
                            ],
                          ),

            ],
          ),
          color: Colors.green,
        ),
      
          ]
        )
    );
  }
}