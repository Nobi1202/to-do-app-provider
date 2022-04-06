import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/todomodel.dart';

class TodosProvider extends ChangeNotifier {
  final List<TodoModel> _todos = [];
  List<TodoModel> _todothanhcong = [];
  List<TodoModel> get todoss => _todos.toList();
  List<TodoModel> get todochuathanhcong =>
      _todos.where((todo) => todo.isSelected == false).toList();
  List<TodoModel> get todoThanhCong =>
      _todothanhcong = _todos.where((todo) => todo.isSelected == true).toList();

  void addTodoItem(String text) {
    _todos.add(TodoModel(text, false));
    notifyListeners();
  }
}
