import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studentessentials/constant.dart';
import 'package:studentessentials/hooks/box_hook.dart';

import 'models/note_model.dart';

class EditNotePage extends HookWidget {
  const EditNotePage({
    Key? key,
    this.existNote,
  }) : super(key: key);

  final NoteModel? existNote;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   currentNote = ModalRoute.of(context).settings.arguments as NoteModel;
  //   if (currentNote == null) {
  //     currentNote = NoteModel(
  //         id: Uuid().v4(), title: "", content: "", datetime: DateTime.now());
  //     isNoteNew = true;
  //   } else {
  //     isNoteNew = false;
  //   }
  //   titleController.text = currentNote.title;
  //   contentController.text = currentNote.content;
  // }

  @override
  Widget build(BuildContext context) {
    final isDirty = useState(false);
    final isNoteNew = useState(existNote == null);
    final titleFocus = useFocusNode();
    final contentFocus = useFocusNode();
    final selectedTag = useState(existNote?.noteTag ?? NoteTag.home);

    final titleController = useTextEditingController(text: existNote?.title);
    final contentController =
        useTextEditingController(text: existNote?.content);
    final notebox = useBox<NoteModel>(Constant.kHiveNoteBox);

    final currentNote = useState(existNote ?? NoteModel.init());

    Future<void> handleSave() async {
      if (contentController.text.isEmpty) {
        return;
      }

      currentNote.value = currentNote.value.copyWith(
          title: titleController.text,
          content: contentController.text,
          noteTag: selectedTag.value);

      final res = await Constant.handleFuture<void>(
          notebox!.put(currentNote.value.id, currentNote.value));

      if (res.isError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error : ${res.error}"),
          ),
        );
      }

      // await notebox!
      //     .put(currentNote.value.id, currentNote.value)
      //     .then((value) => debugPrint(currentNote.value.toString()));
      // if (isNoteNew.value) {
      //   // await Hive.box<NoteModel>(kHiveNoteBox)
      //   //     .put(currentNote.id, currentNote);
      // } else {
      //   // await Hive.box<NoteModel>(kHiveNoteBox)
      //   //     .put(currentNote.id, currentNote);
      // }

      // isNoteNew.value = false;
      // isDirty.value = false;
      // selectedTag.value = NoteTag.home;

      titleFocus.unfocus();
      contentFocus.unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Note Saved "),
        ),
      );
    }

    void markImportantAsDirty() {
      currentNote.value.isImportent = !currentNote.value.isImportent;

      handleSave();
    }

    Future<void> handleDelete() async {
      if (isNoteNew.value) {
        Navigator.pop(context);
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                title: const Text('Delete Note'),
                content: const Text('This note will be deleted permanently'),
                actions: <Widget>[
                  TextButton(
                    child: Text('DELETE',
                        style: TextStyle(
                            color: Colors.red.shade300,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1)),
                    onPressed: () async {
                      // await Hive.box<NoteModel>(kHiveNoteBox)
                      //     .delete(currentNote.id);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text('CANCEL',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    }

    void handleBack() {
      Navigator.pop(context);
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  focusNode: titleFocus,
                  autofocus: isNoteNew.value,
                  controller: titleController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onSubmitted: (text) {
                    titleFocus.unfocus();
                    FocusScope.of(context).requestFocus(contentFocus);
                  },
                  onChanged: (val) {
                    isDirty.value = true;
                  },
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w700),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Enter a title',
                    hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 32,
                        // fontFamily: 'ZillaSlab',
                        fontWeight: FontWeight.w700),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  focusNode: contentFocus,
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (value) {
                    isDirty.value = true;
                  },
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Start typing...',
                    hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    border: InputBorder.none,
                  ),
                ),
              ),
              // ImageFilter.blur()
            ],
          ),
          ClipRRect(
            child: Container(
              height: 80,
              width: double.infinity,
              color: Colors.amber,
              child: SafeArea(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: handleBack,
                    ),
                    const Spacer(),
                    DropdownButton<NoteTag>(
                      value: selectedTag.value,
                      items: [
                        ...noteTagString.entries
                            .toList()
                            .map((e) => DropdownMenuItem(
                                  child: Text(e.value),
                                  value: e.key,
                                ))
                            .toList()
                      ],
                      onChanged: (value) {
                        selectedTag.value = value!;
                      },
                    ),
                    const Spacer(),
                    IconButton(
                      tooltip: 'Mark note as important',
                      icon: Icon(currentNote.value.isImportent
                          ? Icons.flag
                          : Icons.outlined_flag),
                      onPressed: titleController.text.trim().isNotEmpty &&
                              contentController.text.trim().isNotEmpty
                          ? markImportantAsDirty
                          : null,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () async {
                        await handleDelete();
                      },
                    ),
                    AnimatedContainer(
                        margin: const EdgeInsets.only(left: 5),
                        duration: const Duration(milliseconds: 200),
                        width: isDirty.value ? 80 : 0,
                        height: 42,
                        curve: Curves.decelerate,
                        child: TextButton(
                          child: const Text('SAVE'),
                          onPressed: handleSave,
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// RaisedButton.icon(
//                         color: Theme.of(context).accentColor,
//                         textColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(80),
//                             bottomLeft: Radius.circular(80),
//                           ),
//                         ),
//                         icon: Icon(Icons.done),
//                         label: Text(
//                           'SAVE',
//                           style: TextStyle(letterSpacing: 1),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         onPressed: handleSave,
//                       ),
