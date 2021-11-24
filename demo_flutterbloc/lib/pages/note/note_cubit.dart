import 'package:demo_flutterbloc/model/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteCubit extends Cubit<List<Note>> implements NoteAction {
  NoteCubit() : super([]);

  // addNote(Note note) {

  // }

  deleteNote(int id) {
    print(id);
    state.removeWhere((element) => element.id == id);
    emit(state + []);
  }

  updateNote(int id, String title, String date, String content) {
    print(id);
    for (var element in state) {
      if (element.id == id) {
        element.content = content;
        element.title = title;
        element.date = date;
      }
    }

    emit(state + []);
  }

  @override
  maiNote(Note note) {
    emit(state + [note]);
  }
}

abstract class NoteAction {
  maiNote(Note note);
}
