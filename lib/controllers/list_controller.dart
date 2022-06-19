import 'package:unit_test_and_mocking/models/todo.dart';
import 'package:unit_test_and_mocking/services/database.dart';

class ListController {
  Database? database;
  List<TodoModel> todoList = [];
  ListController(this.database);

  void addTodo(TodoModel todo) {
    todoList.add(todo);
  }

  void checkboxSelected(bool newValue, int index) {
    todoList[index].done = newValue;
  }

  void clear() {
    todoList.clear();
  }

  Future<void> loadFromDatabase() async {
    todoList.add(await database!.loadDatabase());
  }
}
