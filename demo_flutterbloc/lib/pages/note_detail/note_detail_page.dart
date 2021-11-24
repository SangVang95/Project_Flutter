import 'package:demo_flutterbloc/model/note.dart';
import 'package:flutter/material.dart';

class NoteDetailPage extends StatefulWidget {
  final Note note;

  final Function(int) onDeleleNote;
  final Function(int, String, String, String) onUpdateNote;

  const NoteDetailPage(
      {Key? key,
      required this.note,
      required this.onDeleleNote,
      required this.onUpdateNote})
      : super(key: key);

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  final _titleController = TextEditingController();

  final _contentController = TextEditingController();

  final _dateController = TextEditingController();

  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.note.title;
    _dateController.text = widget.note.date;
    _contentController.text = widget.note.content;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.7,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textfieldInput(_titleController, 16, FontWeight.bold),
                      const SizedBox(
                        height: 30,
                      ),
                      textfieldInput(_dateController, 12, FontWeight.normal),
                      const SizedBox(
                        height: 30,
                      ),
                      textfieldInput(_contentController, 12, FontWeight.normal),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
              bottomBar()
            ],
          ),
        ));
  }

  _onEditOrSave() {
    setState(() {
      isEdit = !isEdit;
    });
    if (!isEdit) {
      widget.onUpdateNote(widget.note.id, _titleController.text,
          _dateController.text, _contentController.text);
      print(_titleController.text);
      print(_dateController.text);
      print(_contentController.text);
    }
  }

  Widget textfieldInput(TextEditingController controller, double fontsize,
      FontWeight fontWeight) {
    return TextField(
        enabled: isEdit,
        maxLines: null,
        decoration: const InputDecoration(border: InputBorder.none),
        controller: controller,
        style: TextStyle(fontSize: fontsize, fontWeight: fontWeight));
  }

  Widget bottomBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              spreadRadius: 0,
              blurRadius: 4)
        ]),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  widget.onDeleleNote(widget.note.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            // InkWell(
            //   onTap: _onAdd,
            //   child: Container(
            //     child: const Icon(
            //       Icons.add,
            //       color: Colors.white,
            //     ),
            //     decoration: const BoxDecoration(
            //         color: Colors.black, shape: BoxShape.circle),
            //   ),
            // ),
            IconButton(
                splashColor: Colors.white,
                onPressed: _onEditOrSave,
                icon: Icon(
                  isEdit == true ? Icons.save : Icons.edit,
                )),
          ],
        ),
      ),
    );
  }
}
