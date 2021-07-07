class Todo {
  late String text;
  late bool done;
  Todo({required this.text, this.done = false});

  factory Todo.fromJson(Map<String, dynamic> json) =>
      Todo(text: json['text'], done: json['done']);

  Map<String, dynamic> toJson() => {'text': text, 'done': done};
}
