// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookMarkModelAdapter extends TypeAdapter<BookMarkModel> {
  @override
  final int typeId = 1;

  @override
  BookMarkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMarkModel(
      id: fields[0] as int,
      title: fields[1] as String,
      state: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BookMarkModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMarkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
