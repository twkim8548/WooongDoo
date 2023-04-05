import 'dart:convert';

class TodoModel {
  final String title, content;
  final DateTime createdAt;

  TodoModel(
      {required this.title, required this.content, required this.createdAt});

  TodoModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        createdAt = json['createdAt'];

  static Map<String, dynamic> toMap(TodoModel todoModel) => {
        'title': todoModel.title,
        'content': todoModel.content,
        'createdAt': todoModel.createdAt,
      };

  static String encode(List<TodoModel> todos) {
    json.encode(
      todos.map<Map<String, dynamic>>((todo) => TodoModel.toMap(todo)).toList(),
    );

    throw Error();
  }

  static List<TodoModel> decode(String todos) {
    (json.decode(todos) as List<dynamic>)
        .map<TodoModel>((todo) => TodoModel.fromJson(todo))
        .toList();

    throw Error();
  }
}
