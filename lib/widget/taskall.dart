import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/todo_provider.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class TaskAll extends StatefulWidget {
  const TaskAll({Key? key}) : super(key: key);

  @override
  _TaskAllState createState() => _TaskAllState();
}

class _TaskAllState extends State<TaskAll> {
  final TextEditingController _themTask = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<TodosProvider>(context, listen: true);
    final todos = providers.todoss;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Task",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                _displayDialog();
              },
              child: const Text(
                "Create task",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    value: todos[index].isSelected,
                    onChanged: (value) {
                      todos[index].isSelected = !todos[index].isSelected;
                      setState(() {
                        todos[index].isSelected = value!;
                        // if (todos[index].isSelected = false) {
                        //   listchuathanhcong
                        //       .add(Todomodel(todos[index].text, true));
                        // }
                      });
                    },
                    title: Text(todos[index].text),
                  );
                  // ListTodo(todos[index].text, todos[index].isSelected,
                  //     index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _displayDialog() async {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a new to do item'),
            content: Form(
              key: _formKey,
              child: TextFormField(
                controller: _themTask,
                decoration: const InputDecoration(hintText: 'Enter task here'),
                validator: (title) {
                  if (title!.isEmpty) {
                    return 'The title cannot be empty';
                  }
                  return null;
                },
              ),
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  final isValid = _formKey.currentState?.validate();
                  if (!isValid!) {
                    return;
                  } else {
                    provider.addTodoItem(_themTask.text);
                  }

                  Navigator.of(context).pop();
                },
                child: const Text('Submit'),
              )
            ],
          );
        });
  }
}
