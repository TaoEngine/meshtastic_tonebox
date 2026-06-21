// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectDataAdapter extends TypeAdapter<ProjectData> {
  @override
  final typeId = 0;

  @override
  ProjectData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectData(
      name: fields[0] as String,
      length: (fields[1] as num).toInt(),
      bpm: (fields[2] as num).toInt(),
      key: fields[3] as Note,
      sheet: (fields[4] as List).cast<SheetItemData>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProjectData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.length)
      ..writeByte(2)
      ..write(obj.bpm)
      ..writeByte(3)
      ..write(obj.key)
      ..writeByte(4)
      ..write(obj.sheet);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SheetItemDataAdapter extends TypeAdapter<SheetItemData> {
  @override
  final typeId = 1;

  @override
  SheetItemData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SheetItemData(
      note: fields[0] as Note?,
      octave: (fields[1] as num).toInt(),
      dotted: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SheetItemData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.note)
      ..writeByte(1)
      ..write(obj.octave)
      ..writeByte(2)
      ..write(obj.dotted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SheetItemDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
