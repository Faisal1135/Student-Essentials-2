// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteModelAdapter extends TypeAdapter<NoteModel> {
  @override
  final int typeId = 7;

  @override
  NoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteModel(
      id: fields[6] as String,
      title: fields[0] as String,
      content: fields[2] as String,
      datetime: fields[3] as DateTime,
      noteTag: fields[4] as NoteTag,
      isImportent: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, NoteModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.datetime)
      ..writeByte(4)
      ..write(obj.noteTag)
      ..writeByte(5)
      ..write(obj.isImportent)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NoteTagAdapter extends TypeAdapter<NoteTag> {
  @override
  final int typeId = 8;

  @override
  NoteTag read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NoteTag.home;
      case 1:
        return NoteTag.work;
      case 2:
        return NoteTag.important;
      case 3:
        return NoteTag.complete;
      default:
        return NoteTag.home;
    }
  }

  @override
  void write(BinaryWriter writer, NoteTag obj) {
    switch (obj) {
      case NoteTag.home:
        writer.writeByte(0);
        break;
      case NoteTag.work:
        writer.writeByte(1);
        break;
      case NoteTag.important:
        writer.writeByte(2);
        break;
      case NoteTag.complete:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
