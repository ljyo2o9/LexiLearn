import 'package:lexi_learn/data/model/finding_wiki_model.dart';
import 'package:dio/dio.dart';

import 'package:lexi_learn/secret.dart';

class FindingWikiData {
  Future<List<AnswerInfo>> getWikiData(String word) async {
    final baseOptions = BaseOptions(
      baseUrl: 'http://aiopen.etri.re.kr:8000',
      headers: {'Authorization': secret},
      contentType: 'Application/json',
    );
    Dio dio = Dio(baseOptions);

    final response = await dio.post('/WikiQA', data: {
      "request_id": "1",
      "argument": {"type": "hybridqa", "question": word}
    });

    if (response.statusCode == 200) {
      var responseData = FindingWikiModel.fromJson(response.data);

      return responseData.returnObject?.wiKiInfo?.answerInfo ?? [];
    } else {
      throw Exception(response.data);
    }
  }
}
