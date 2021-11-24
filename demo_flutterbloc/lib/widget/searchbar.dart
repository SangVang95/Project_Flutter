import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  Function(String) _onTyping;

  SearchBar(this._onTyping, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => _onTyping(value),
      cursorColor: Colors.grey,
      decoration: const InputDecoration(
          focusColor: Colors.grey,
          fillColor: Colors.grey,
          hintText: 'Search Your Notes',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)))),
    );
  }
}
