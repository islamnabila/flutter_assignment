import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'class.dart';

class AddTodo extends StatefulWidget {
  final Function(Todo) onAddTodo;
  const AddTodo({
    super.key, required this.onAddTodo,
  });

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController addtitleController =TextEditingController();
  final TextEditingController addDetailsController =TextEditingController();
  GlobalKey<FormState> _globalKey =GlobalKey<FormState>();

  void dispose() {
    // Dispose of the text controllers when the state is disposed.
    addtitleController.dispose();
    addDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          TextFormField(
            controller: addtitleController,
            decoration: const InputDecoration(
              hintText: "Add Title",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder()),
            validator: (String? value){
              if(value?.isEmpty??true){
                return "Enter a value";
              } return null;
            }
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: addDetailsController,
            decoration: const InputDecoration(
              hintText: "Add description",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder()),
            validator: (String? value){
              if(value?.isEmpty?? true){
                return "Enter a value";
              } return null;
            }
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.red, minimumSize: Size(70, 36)),
              onPressed: () {
                if(_globalKey.currentState!.validate()){
                  Todo newtodo = Todo(title: addtitleController.text.trim(), details: addDetailsController.text.trim());
                  widget.onAddTodo(newtodo);
                  addtitleController.clear();
                  addDetailsController.clear();
                }
              },
              child: const Text("Add"))
        ],
      ),
    );
  }
}
