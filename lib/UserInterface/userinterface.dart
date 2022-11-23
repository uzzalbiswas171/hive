

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserInterface extends StatefulWidget {
  const UserInterface({Key? key,this.value,required this.myboxlist}) : super(key: key);
final String ? value;
final int myboxlist;
  @override
  State<UserInterface> createState() => _UserInterfaceState();
}



class _UserInterfaceState extends State<UserInterface> {

  Box ? mybox;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text("Online News",style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        ),
        actions: [
          IconButton(onPressed: (){},
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: (){},
            icon: Icon(Icons.notifications),
          ),
          IconButton(onPressed: (){},
            icon: Icon(Icons.call),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: ListView.builder(
           scrollDirection: Axis.vertical,
            itemCount: widget.myboxlist,
            itemBuilder: (context,index){
                    return Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        height: 205,
                        width: double.infinity,
                        // color: Colors.amber,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 6,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  color: Colors.amber,
                                  child: Text("${widget.value}"),
                                ),
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 40,
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                color: Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Container(
                                      height: 40,
                                      width: 100,
                                      child: Text("Sseen 5k"),
                                    ),

                                    Container(
                                      width: 100,
                                      height: 40,
                                      child: Text("Comment"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    );


            }
        ),
      )
    );
  }
}
