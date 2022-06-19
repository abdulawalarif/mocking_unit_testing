import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_and_mocking/controllers/list_controller.dart';
import 'package:unit_test_and_mocking/models/todo.dart';
import 'package:unit_test_and_mocking/services/database.dart';

void main() {
  setUp(() {
    //this both files calles before every test runs
    // so in future when we will test something we must initilize things we need to
    // in this section ...
  });
  tearDown(() {
    // tearDown..
  });

  group("TodoController", () {
    test("Initializes with empty", () {
      ListController _listController;
      Database database = Database();
      _listController = ListController(database);
      expect(_listController.todoList.length, 0);
    });

    test("Todo Added", () {
      ListController _listController;
      Database database = Database();
      _listController = ListController(database);
      _listController.addTodo(TodoModel("Get Groceries", false));
      expect(_listController.todoList.length, 1);
      expect(_listController.todoList[0].content, "Get Groceries");
    });

    test("Checkbox Selected", () {
      ListController _listController;
      Database database = Database();
      _listController = ListController(database);
      _listController.addTodo(TodoModel("Get Groceries", false));
      expect(_listController.todoList[0].done, false);
      _listController.checkboxSelected(true, 0);
      expect(_listController.todoList[0].done, true);
    });
  });
}
