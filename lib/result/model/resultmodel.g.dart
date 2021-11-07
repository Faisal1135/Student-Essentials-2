// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultModelAdapter extends TypeAdapter<ResultModel> {
  @override
  final int typeId = 0;

  @override
  ResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultModel(
      id: fields[0] as String,
      courseName: fields[1] as String,
      credit: fields[2] as double,
      grade: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ResultModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.courseName)
      ..writeByte(2)
      ..write(obj.credit)
      ..writeByte(3)
      ..write(obj.grade);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OwnerAdapter extends TypeAdapter<Owner> {
  @override
  final int typeId = 1;

  @override
  Owner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Owner(
      name: fields[0] as String,
      sid: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Owner obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.sid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResultListModelAdapter extends TypeAdapter<ResultListModel> {
  @override
  final int typeId = 3;

  @override
  ResultListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultListModel(
      id: fields[0] as String,
      username: fields[1] as String,
      results: (fields[2] as List).cast<ResultModel>(),
      cgpa: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ResultListModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.results)
      ..writeByte(3)
      ..write(obj.cgpa);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
