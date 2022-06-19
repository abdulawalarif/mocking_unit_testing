import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test_and_mocking/controllers/list_controller.dart';
import 'package:unit_test_and_mocking/models/todo.dart';
import 'package:unit_test_and_mocking/services/database.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  MockDatabase _mockDatabase = MockDatabase();
  ListController _listController;
  _listController = ListController(_mockDatabase);
  setUp(() {
    //this both files calles before every test runs
    // so in future when we will test something we must initilize things we need to
    // in this section ...
  });

  tearDown(() {
    _listController =
        ListController(_mockDatabase); // Optional for this scenario
  });

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

  test("Mock Database call", () async {
    when(_mockDatabase.loadDatabase()).thenAnswer(
      (realInvocation) => Future.value(
        TodoModel("From Mock", true),
      ),
    );
    await _listController.loadFromDatabase();
    expect(_listController.todoList[0].content, "From Mock");
  });
}
