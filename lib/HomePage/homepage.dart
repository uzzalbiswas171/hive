import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_project_1/UserInterface/userinterface.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _nameControllor=TextEditingController();
  TextEditingController _editControllor=TextEditingController();
  Box ? myBox;
  @override
  void initState() {
    myBox=Hive.box("Mylist");
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  children: [
    Expanded(
      flex: 2,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            border: Border.all(color: Colors.black)
          ),
          child: Column(
            children: [
              TextField(
                controller: _nameControllor,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: InkWell(
                      onTap:(){
                        var country=_nameControllor.text;
                        myBox!.add(country);
                        _nameControllor.text=" ";

                      },
                      child: Container(
                        height:30,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.blue,
                        ),
                        child: Text("Add here"),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height:30,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.blue,
                      ),
                      child: Text("update"),
                    ),
                  ),
                  Center(
                    child: Container(
                      height:30,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.blue,
                      ),
                      child: Text("Delete"),
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
    ),
    SizedBox(height: 20,),
    Expanded(
        flex:4,
        child:ValueListenableBuilder(
            valueListenable: Hive.box("Mylist").listenable(),
            builder: (context,box,widget){
              return ListView.builder(
                scrollDirection: Axis.vertical,
                  itemCount: myBox!.keys.toList().length,
                  itemBuilder:(context,index){
                    String name=myBox!.getAt(index).toString();
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserInterface(
                              value: name,
                          myboxlist:myBox!.keys.toList().length,
                        ),),);
                      },
                      child: Card(
                        shape: Border.all(
                          width: 1,
                          color: Colors.red,
                        ),
                        child: ListTile(
                          leading: Text(name),
                          trailing: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(11),
                                bottomLeft:Radius.circular(11),
                              ),
                              color: Colors.amber,
                            ),
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: (){
                                    showDialog(
                                        context: context,
                                        builder: (context){
                                          return AlertDialog(
                                            content: Column(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: TextField(
                                                    controller: _editControllor,
                                                    decoration: InputDecoration(
                                                      labelText: name
                                                    ),
                                                  ),
                                                ),
SizedBox(
  height: 20,
),
                                                Center(
                                                  child: InkWell(
                                                    onTap: (){
                                                    myBox!.putAt(index, _editControllor.text);
                                                    Navigator.pop(context);
                                                    _editControllor.text="";
                                                  },
                                                    child: Container(
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.only(
                                                          bottomLeft: Radius.circular(22),
                                                          topRight: Radius.circular(22),
                                                        ),
                                                        color: Colors.blue,
                                                      ),
                                                      width: 100,

                                                      alignment: Alignment.center,
                                                      child: Text("Edit"),
                                                    ),
                                                  ),
                                                )


                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: (){
                                    myBox?.deleteAt(index);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              );
            }),
    ),
  ],
),
    );
  }
}
