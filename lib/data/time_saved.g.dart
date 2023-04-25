// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_saved.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeSavedAdapter extends TypeAdapter<TimeSaved> {
  @override
  final int typeId = 1;

  @override
  TimeSaved read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeSaved(
      second: fields[0] as int?,
      minut: fields[1] as int?,
      hour: fields[2] as int?,
      day: fields[3] as int?,
      month: fields[4] as int?,
      year: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TimeSaved obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.second)
      ..writeByte(1)
      ..write(obj.minut)
      ..writeByte(2)
      ..write(obj.hour)
      ..writeByte(3)
      ..write(obj.day)
      ..writeByte(4)
      ..write(obj.month)
      ..writeByte(5)
      ..write(obj.year);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeSavedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
