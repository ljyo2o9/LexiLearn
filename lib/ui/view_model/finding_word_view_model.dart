import 'package:flutter/widgets.dart';

import 'package:lexi_learn/data/model/finding_words_model.dart';
import 'package:lexi_learn/data/repository/finding_words.repository.dart';

class FindingWordsViewModel extends ChangeNotifier {
  final FindingWordsRepository _findingWordsRepository =
      FindingWordsRepository();

  FindingWordsViewModel() {
    _getFindingWordsList();
  }

  List<WWNWordInfo> _findingWordsList = [];

  List<WWNWordInfo> get findingWordsList => _findingWordsList;

  Future<void> _getFindingWordsList() async {
    _findingWordsList = await _findingWordsRepository.getWeatherList();
    notifyListeners();
  }
}
