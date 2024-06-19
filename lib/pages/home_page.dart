import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/data/database.dart';
import '../components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever opening the app, then create dafault data
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    } 
    else{
      //there already exists data
      db.loadData();
    }

    super.initState();
  }

  //text Controller
  final _controller = TextEditingController();



    void checkBoxChanged(bool? value, int index){      //method for checkbox
      setState(() {
        db.toDoList[index][1] = !db.toDoList[index][1];
      });
      db.updateDataBase();
    }

    void saveNewTask(){
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDataBase();
    }

    void createNewTask(){                             //methode for new Task
      showDialog(
        context: context, 
        builder: ((context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        }
      )
    );
  }

  void deletTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child:Icon(Icons.add),
      
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder:(context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onChanged:(value) => checkBoxChanged(value, index),
            deletFunction: (context) => deletTask(index),
            );
          },
        ),
      );
  }
}