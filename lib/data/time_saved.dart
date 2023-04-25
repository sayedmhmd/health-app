import 'package:hive/hive.dart';

part 'time_saved.g.dart';

@HiveType(typeId: 1)
class TimeSaved {
  TimeSaved(
      {required this.second,
      required this.minut,
      required this.hour,
      required this.day,
      required this.month,
      required this.year});
  @HiveField(0)
  int? second;

  @HiveField(1)
  int? minut;

  @HiveField(2)
  int? hour;

  @HiveField(3)
  int? day;

  @HiveField(4)
  int? month;

  @HiveField(5)
  int? year;
}
