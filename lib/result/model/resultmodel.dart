import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'resultmodel.g.dart';

@HiveType(typeId: 0)
class ResultModel extends HiveObject {
  @HiveField(0)
  String id;
  // Hive fields go here

  @HiveField(1)
  String courseName;

  @HiveField(2)
  double credit;

  @HiveField(3)
  double grade;

  ResultModel({
    required this.id,
    required this.courseName,
    required this.credit,
    required this.grade,
  });

  @override
  String toString() {
    return 'ResultModel(id: $id, courseName: $courseName, credit: $credit, grade: $grade)';
  }

  ResultModel copyWith({
    String? id,
    String? courseName,
    double? credit,
    double? grade,
  }) {
    return ResultModel(
      id: id ?? this.id,
      courseName: courseName ?? this.courseName,
      credit: credit ?? this.credit,
      grade: grade ?? this.grade,
    );
  }
}

@HiveType(typeId: 1)
class Owner extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String sid;
  Owner({
    required this.name,
    required this.sid,
  });

  factory Owner.init() {
    return Owner(
      name: 'no name',
      sid: const Uuid().v4(),
    );
  }

  Owner.withId()
      : sid = const Uuid().v4(),
        name = "no name";
}

@HiveType(typeId: 3)
class ResultListModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String username;

  @HiveField(2)
  List<ResultModel> results = [];

  @HiveField(3)
  String cgpa;

  ResultListModel({
    required this.id,
    required this.username,
    required this.results,
    required this.cgpa,
  });

  ResultListModel.init()
      : cgpa = '0',
        id = const Uuid().v4(),
        results = [],
        username = 'no name';

  ResultListModel copyWith({
    String? id,
    String? username,
    List<ResultModel>? results,
    String? cgpa,
  }) {
    return ResultListModel(
      id: id ?? this.id,
      username: username ?? this.username,
      results: results ?? this.results,
      cgpa: cgpa ?? this.cgpa,
    );
  }

  @override
  String toString() {
    return 'ResultListModel(id: $id, username: $username, results: $results, cgpa: $cgpa)';
  }
}
