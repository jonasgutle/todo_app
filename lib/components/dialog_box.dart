import "package:flutter/material.dart";
import "package:todo_app/components/my_button.dart";

class DialogBox extends StatelessWidget {
  final controller;                                       //to handle text in dialog box
  VoidCallback onSave;
  VoidCallback onCancel;



  DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(                            // get user input
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task"
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "Save", onPressed: onSave),

              const SizedBox(width: 8),

              MyButton(text: "Cancel", onPressed: onCancel),
              
            ],
          )                                   


        ],),
      ),
    );
  }
}