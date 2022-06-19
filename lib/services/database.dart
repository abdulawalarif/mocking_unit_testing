import 'package:unit_test_and_mocking/models/todo.dart';

class Database {
  Future<TodoModel> loadDatabase() async {
    try {
      Future.delayed(Duration(seconds: 3));
      print("this got called?!?");
      return TodoModel("From Database", true);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
