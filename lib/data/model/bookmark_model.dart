import 'package:hive/hive.dart';

part 'bookmark_model.g.dart';

@HiveType(typeId: 1)
class BookMarkModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  bool state;

  BookMarkModel({required this.id, required this.title, required this.state});

  factory BookMarkModel.fromMap(Map<String, dynamic> map) {
    return BookMarkModel(
      id: map['id'],
      title: map['title'],
      state: map['state'],
    );
  }
}
