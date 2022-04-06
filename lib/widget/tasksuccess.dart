import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TaskSuccess extends StatefulWidget {
  const TaskSuccess({Key? key}) : super(key: key);
  @override
  _TaskSuccessState createState() => _TaskSuccessState();
}

class _TaskSuccessState extends State<TaskSuccess> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    final todos = provider.todoThanhCong;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Complete'),
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
