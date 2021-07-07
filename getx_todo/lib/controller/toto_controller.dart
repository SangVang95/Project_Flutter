import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo/model/todo.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todos');

    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }

    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });

    super.onInit();
  }
}
