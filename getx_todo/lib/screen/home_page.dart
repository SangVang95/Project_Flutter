import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/toto_controller.dart';
import 'package:getx_todo/screen/todo_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController _controller = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection todo'),
      ),
      body: Container(
        child: Obx(() => ListView.separated(
            itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    var removed = _controller.todos[index];
                    _controller.todos.removeAt(index);
                    Get.snackbar('Removed', removed.text,
                        mainButton: TextButton(
                            onPressed: () {
                              _controller.todos.insert(index, removed);
                            },
                            child: Text('Undo')));
                  },
                  child: ListTile(
                      title: buildTitle(_controller, index, context),
                      onTap: () {
                        Get.to(TodoPage(index));
                      },
                      trailing: Icon(Icons.chevron_right),
                      leading: Checkbox(
                          value: _controller.todos[index].done,
                          onChanged: (value) {
                            var newTodo = _controller.todos[index];
                            newTodo.done = value!;
                            print(newTodo.text);
                            print(newTodo.done);
                            print(value);
                            _controller.todos[index] = newTodo;
                          })),
                ),
            separatorBuilder: (_, __) => Divider(),
            itemCount: _controller.todos.length)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TodoPage(-1));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Text buildTitle(TodoController _controller, int index, BuildContext context) {
    return Text(_controller.todos[index].text,
        style: _controller.todos[index].done
            ? TextStyle(
                color: Colors.red, decoration: TextDecoration.lineThrough)
            : TextStyle(color: Theme.of(context).textTheme.bodyText1!.color));
  }
}
