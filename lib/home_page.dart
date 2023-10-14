import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_todo.dart';
import 'update_todo.dart';
import 'class.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> tasks =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Icon(
            Icons.search,
            color: Colors.blue,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              AddTodo(onAddTodo: (Todo todo) {
                addtodo(todo);
              },),
              const SizedBox(
                height: 40,
              ),
        Expanded(
          child: ListView.separated(
              itemCount: tasks.length,
              separatorBuilder: (BuildContext context, int index)=>Divider(height: 10,),
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.grey.shade300,
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: const Text("Alert"),
                              content: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return UpdateTodo(
                                                todos: tasks[index],
                                                index: index,
                                                todoUpdate: (String updateTitle, String updateDetails, int index){
                                                  updatetodo(index, updateTitle, updateDetails);
                                                  Navigator.pop(context);

                                                },

                                              );
                                            });
                                      },
                                      child: const Text("Edit")),
                                  TextButton(
                                      onPressed: () {
                                        deletetodo(index);
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Delete"))
                                ],
                              ));
                        });
                  },
                  title: Text(tasks[index].title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  subtitle: Text(tasks[index].details),
                  trailing: const Icon(Icons.arrow_forward),
                );
              },
          ),
        )
            ],
          ),
        ),
      ),
    );
  }

  void addtodo(Todo todo){
    tasks.add(todo);
    setState(() {});
  }

  void deletetodo(int index){
    tasks.removeAt(index);
    setState(() {
    });
  }

  void updatetodo(int index, String updateTitle, String updateDetails) {
    tasks[index].title = updateTitle;
    tasks[index].details = updateDetails;
    setState(() {});
  }
}




