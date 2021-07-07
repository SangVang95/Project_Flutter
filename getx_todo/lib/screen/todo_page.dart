import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/toto_controller.dart';
import 'package:getx_todo/model/todo.dart';

class TodoPage extends StatelessWidget {
  final TodoController _controller = Get.find();
  final _textController = TextEditingController();

  late int index;
  TodoPage(this.index);

  @override
  Widget build(BuildContext context) {
    print(index);
    return Scaffold(
        body: Container(
      child: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _textController,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: 'what is to do',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              style: TextStyle(fontSize: 25),
              keyboardType: TextInputType.multiline,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      if (index.isLowerThan(0)) {
                        _controller.todos.add(Todo(text: _textController.text));
                      } else {
                        var editing = _controller.todos[index];
                        editing.text = _textController.text;
                        _controller.todos[index] = editing;
                      }
                      Get.back();
                    },
                    child: index.isLowerThan(0) ? Text('Add') : Text('Edit')),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
