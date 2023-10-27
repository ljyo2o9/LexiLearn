import 'package:lexi_learn/data/model/bookmark_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkData {
  Box<BookMarkModel>? box;

  var cnt = 0;
  dynamic response;

  BookMarkData() {
    init();
  }

  Future<void> init() async {
    box = Hive.box<BookMarkModel>('bookmark');
  }

  Future<List<BookMarkModel>> getBookMark() async {
    if (box == null) await init();
    response = box!.values.toList();
    return response;
  }

  Future<void> postBookMark(id, title, state) async {
    if (box == null) await init();

    var data = BookMarkModel(id: id + cnt, title: title, state: state);

    cnt++;

    await box!.add(data);
  }

  Future<void> delBookMark(id) async {
    if (box == null) await init();

    await box!.delete(id);
  }

  Future<void> allDel() async {
    if (box == null) await init();

    await box!.clear();
    cnt = 0;
  }
}
