import 'package:lexi_learn/data/dataSource/bookmark_data_source.dart';
import 'package:lexi_learn/data/model/bookmark_model.dart';

class BookMarkRepository {
  final BookMarkData _bookMarkData = BookMarkData();

  Future<List<BookMarkModel>> getBookMark() async {
    return _bookMarkData.getBookMark();
  }

  Future<void> postBookMark(id, title, state) async {
    await _bookMarkData.postBookMark(id, title, state);
  }

  Future<void> delBookMark(id) async {
    await _bookMarkData.delBookMark(id);
  }

  Future<void> allDel() async {
    await _bookMarkData.allDel();
  }
}
