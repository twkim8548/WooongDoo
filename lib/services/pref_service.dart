import 'package:application/model/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  // late SharedPreferences prefs;

  static Future<List<TodoModel>> getTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<TodoModel> todos = [];

    if (prefs.getString('todos') != null) {
      todos = TodoModel.decode(prefs.getString('todos')!);
    } else {
      todos = [];
      prefs.setString('todos', '');
    }
    return todos;
  }

  static Future<List<TodoModel>> addTodo(TodoModel todo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<TodoModel> todos = [];

    todos = TodoModel.decode(prefs.getString('todos')!);
    todos.add(todo);

    TodoModel.encode(todos);

    return todos;
  }
}
