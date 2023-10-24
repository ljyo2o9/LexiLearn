import 'package:lexi_learn/data/dataSource/finding_wiki_data_source.dart';
import 'package:lexi_learn/data/model/finding_wiki_model.dart';

class FindingWikiRepository {
  final FindingWikiData _findingWikiData = FindingWikiData();

  Future<List<AnswerInfo>> getWikiRepository(String word) async {
    return _findingWikiData.getWikiData(word);
  }
}
