import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  
  final String taskName;                                  //infos we need for todo list
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletFunction;

  ToDoTile({                                              //????definieren der Methode??
    super.key, 
    required this.taskName, 
    required this.taskCompleted,
    required this.onChanged,
    required this.deletFunction,
    });

    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),                  //space in between
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          
          children: [
            SlidableAction(
              onPressed: deletFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ]),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12)),                        // hight of one box
          
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
                
                ),
        
              Text(                                                   //Text in Textfield
                taskName,
                style: TextStyle(
                  decoration: taskCompleted                           //"if taskCompleted"
                  ?TextDecoration.lineThrough                         //lineThrough
                  :TextDecoration.none),                              //If not, none 
                ),
            ],
          ),
        ),
      ),
    );
  }
}