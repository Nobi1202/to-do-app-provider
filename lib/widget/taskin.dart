import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TaskIn extends StatefulWidget {
  const TaskIn({Key? key}) : super(key: key);

  @override
  _TaskInState createState() => _TaskInState();
}

class _TaskInState extends State<TaskIn> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todochuathanhcong;

    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          "Task Incomplete",
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            value: todos[index].isSelected,
            onChanged: (value) {},
            title: Text(todos[index].text),
          );
        },
      ),
    );
  }
}
