import 'package:flutter/material.dart';

import 'package:lexi_learn/data/model/bookmark_model.dart';
import 'package:lexi_learn/data/repository/bookmark_repository.dart';

class BookMarkViewModel extends ChangeNotifier {
  final BookMarkRepository _bookMarkRepository = BookMarkRepository();

  BookMarkViewModel() {
    getBookMarkList();
  }

  List<BookMarkModel> _bookmarkList = [];

  List<BookMarkModel> get bookmarkList => _bookmarkList;

  Future<void> getBookMarkList() async {
    _bookmarkList = await _bookMarkRepository.getBookMark();
    notifyListeners();
  }

  Future<void> postBookMarkList(id, title, state) async {
    await _bookMarkRepository.postBookMark(id, title, state);
    notifyListeners();
  }

  Future<void> delBookMarkList(id) async {
    await _bookMarkRepository.delBookMark(id);
    notifyListeners();
  }

  Future<void> allDel() async {
    await _bookMarkRepository.allDel();
    _bookmarkList = [];
    notifyListeners();
  }
}
