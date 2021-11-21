import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'note_model.g.dart';

@HiveType(typeId: 7)
class NoteModel {
  @HiveField(0)
  String title;

  @HiveField(2)
  String content;

  @HiveField(3)
  DateTime datetime;

  @HiveField(4)
  NoteTag noteTag;

  @HiveField(5)
  bool isImportent;

  @HiveField(6)
  String id;

  NoteModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.datetime,
      this.noteTag = NoteTag.home,
      this.isImportent = false});

  NoteModel.init()
      : id = const Uuid().v4(),
        datetime = DateTime.now(),
        noteTag = NoteTag.home,
        isImportent = false,
        title = '',
        content = '';

  NoteModel copyWith({
    String? title,
    String? content,
    DateTime? datetime,
    NoteTag? noteTag,
    bool? isImportent,
    String? id,
  }) {
    return NoteModel(
      title: title ?? this.title,
      content: content ?? this.content,
      datetime: datetime ?? this.datetime,
      noteTag: noteTag ?? this.noteTag,
      isImportent: isImportent ?? this.isImportent,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'NoteModel(title: $title, content: $content, datetime: $datetime, noteTag: $noteTag, isImportent: $isImportent, id: $id)';
  }
}

@HiveType(typeId: 8)
enum NoteTag {
  @HiveField(0)
  home,
  @HiveField(1)
  work,
  @HiveField(2)
  important,
  @HiveField(3)
  complete,
}
//Remeber bear you change this cuz you need to update this to important section

const noteTagString = <NoteTag, String>{
  NoteTag.home: "Home",
  NoteTag.important: "Important",
  NoteTag.work: "Work",
  NoteTag.complete: "Complete"
};

// class Note {
//   String title;
//   String content;
//   DateTime date;

//   Note({this.title, this.content, this.date});
// }

//  Map<String, int> categories = {
//   'Notes': 112,
//   'Work': 58,
//   'Home': 23,
//   'Complete': 31,
// };

// final List<Note> notes = [
//   Note(
//     title: 'Buy ticket',
//     content: 'Buy airplane ticket through Kayak for \$318.38',
//     date: DateTime(2019, 10, 10, 8, 30),
//   ),
//   Note(
//     title: 'Walk with dog',
//     content: 'Walk on the street with my favorite dog.',
//     date: DateTime(2019, 10, 10, 8, 30),
//   ),
// ];
