import 'package:dio/dio.dart';
import 'package:lexi_learn/data/model/finding_words_model.dart';

import 'package:lexi_learn/secret.dart';

class FindingWordData {
  Future<List<WWNWordInfo>> getWordData(String word) async {
    final baseOptions = BaseOptions(
      baseUrl: 'http://aiopen.etri.re.kr:8000',
      headers: {'Authorization': secret},
      contentType: 'Application/json',
    );
    Dio dio = Dio(baseOptions);

    final response = await dio.post('/WiseWWN/Word', data: {
      "request_id": "1",
      "argument": {"word": word}
    });

    if (response.statusCode == 200) {
      var responseData = FindingWordsModel.fromJson(response.data);

      return responseData.returnObject?.wWNWordInfo ?? [];
    } else {
      throw Exception(response.data);
    }
  }
}
