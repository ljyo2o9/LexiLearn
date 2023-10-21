import 'package:lexi_learn/data/model/finding_words_model.dart';
import 'package:lexi_learn/data/dataSource/finding_words.data_source.dart';

class FindingWordsRepository {
  final FindingWordData _findingWordData = FindingWordData();

  Future<List<WWNWordInfo>> getWeatherList(String word) async {
    return _findingWordData.getWordList(word);
  }
}
