import 'dart:math';

import 'package:demo_flutterbloc/model/note.dart';
import 'package:demo_flutterbloc/pages/note_detail/note_detail_page.dart';
import 'package:demo_flutterbloc/widget/note_item.dart';
import 'package:demo_flutterbloc/widget/searchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'note_cubit.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
            elevation: 0.7,
            title: const Text(
              'Notes',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SearchBar(_onTyping),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(child: BlocBuilder<NoteCubit, List<Note>>(
                    builder: (context, state) {
                      return ListView.builder(
                          itemCount: state.length,
                          itemBuilder: (context, index) => NoteItem(
                                note: state[index],
                                color: Colors.primaries[
                                    Random().nextInt(Colors.primaries.length)],
                                onTap: _onTapNoteItem,
                              ));
                    },
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            totalNote(),
            addButton(_addNote)
          ],
        ),
      ),
    );
  }

  _addNote() {
    id++;
    // context.read<NoteCubit>().addNote(Note(
    //     id: id, title: '123', content: '13294719237490', date: '11/02/2021'));
    context.read<NoteCubit>().maiNote(Note(
        id: id, title: '123', content: '13294719237490', date: '11/02/2021'));
  }

  _updateNote(int id, String title, String date, String content) {
    context.read<NoteCubit>().updateNote(id, title, date, content);
  }

  _deleteNote(int id) {
    context.read<NoteCubit>().deleteNote(id);
  }

  _onTyping(String text) {
    print(text);
  }

  _onTapNoteItem(Note note) {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetailPage(
          note: note,
          onDeleleNote: _deleteNote,
          onUpdateNote: _updateNote,
        ),
      ),
    );
  }

  Widget totalNote() {
    return Positioned(
        right: 0,
        left: 0,
        bottom: 0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(child: BlocBuilder<NoteCubit, List<Note>>(
            builder: (context, state) {
              return Text('${state.length} Notes');
            },
          )),
        ));
  }

  Widget addButton(Function add) {
    return Positioned(
        right: 20,
        bottom: 100,
        child: InkWell(
          onTap: () {
            add();
          },
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.black,
                offset: Offset(0, 1),
              )
            ], color: Colors.black, shape: BoxShape.circle),
            height: 50,
            width: 50,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ));
  }
}
