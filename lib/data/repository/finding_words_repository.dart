import 'package:lexi_learn/data/model/finding_words_model.dart';
import 'package:lexi_learn/data/dataSource/finding_words_data_source.dart';

class FindingWordsRepository {
  final FindingWordData _findingWordData = FindingWordData();

  Future<List<WWNWordInfo>> getWeatherRepositofy(String word) async {
    return _findingWordData.getWordData(word);
  }
}
