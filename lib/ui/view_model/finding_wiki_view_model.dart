import 'package:flutter/material.dart';

import 'package:lexi_learn/data/repository/finding_wiki_repository.dart';
import 'package:lexi_learn/data/model/finding_wiki_model.dart';

class FindingWikiViewModel extends ChangeNotifier {
  final FindingWikiRepository _findingWikiRepository = FindingWikiRepository();

  String _searchText = '';
  List<AnswerInfo> _findingWikiList = [];

  String get searchText => _searchText;

  List<AnswerInfo> get findingWikiList => _findingWikiList;

  Future<void> getFindingWikiList(word) async {
    _searchText = word;
    _findingWikiList = await _findingWikiRepository.getWikiRepository(word);
    notifyListeners();
  }
}
