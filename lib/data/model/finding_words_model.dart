class FindingWordsModel {
  String? requestId;
  int? result;
  String? returnType;
  ReturnObject? returnObject;

  FindingWordsModel(
      {this.requestId, this.result, this.returnType, this.returnObject});

  FindingWordsModel.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    result = json['result'];
    returnType = json['return_type'];
    returnObject = json['return_object'] != null
        ? ReturnObject.fromJson(json['return_object'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['request_id'] = requestId;
    data['result'] = result;
    data['return_type'] = returnType;
    if (returnObject != null) {
      data['return_object'] = returnObject!.toJson();
    }
    return data;
  }
}

class ReturnObject {
  MetaInfo? metaInfo;
  List<WWNWordInfo>? wWNWordInfo;

  ReturnObject({this.metaInfo, this.wWNWordInfo});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    metaInfo =
        json['MetaInfo'] != null ? MetaInfo.fromJson(json['MetaInfo']) : null;
    if (json['WWN WordInfo'] != null) {
      wWNWordInfo = <WWNWordInfo>[];
      json['WWN WordInfo'].forEach((v) {
        wWNWordInfo!.add(WWNWordInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metaInfo != null) {
      data['MetaInfo'] = metaInfo!.toJson();
    }
    if (wWNWordInfo != null) {
      data['WWN WordInfo'] = wWNWordInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MetaInfo {
  String? title;
  String? link;

  MetaInfo({this.title, this.link});

  MetaInfo.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    link = json['Link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Link'] = link;
    return data;
  }
}

class WWNWordInfo {
  String? word;
  int? homonymCode;
  List<WordInfo>? wordInfo;
  List<String>? synonym;
  List<String>? antonym;

  WWNWordInfo(
      {this.word, this.homonymCode, this.wordInfo, this.synonym, this.antonym});

  WWNWordInfo.fromJson(Map<String, dynamic> json) {
    word = json['Word'];
    homonymCode = json['HomonymCode'];
    if (json['WordInfo'] != null) {
      wordInfo = <WordInfo>[];
      json['WordInfo'].forEach((v) {
        wordInfo!.add(WordInfo.fromJson(v));
      });
    }
    synonym = json['Synonym'].cast<String>();
    antonym = json['Antonym'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Word'] = word;
    data['HomonymCode'] = homonymCode;
    if (wordInfo != null) {
      data['WordInfo'] = wordInfo!.map((v) => v.toJson()).toList();
    }
    data['Synonym'] = synonym;
    data['Antonym'] = antonym;
    return data;
  }
}

class WordInfo {
  int? polysemyCode;
  String? definition;
  String? pOS;
  List<String>? hypernym;
  List<String>? hypornym;

  WordInfo(
      {this.polysemyCode,
      this.definition,
      this.pOS,
      this.hypernym,
      this.hypornym});

  factory WordInfo.fromJson(Map<String, dynamic> json) => WordInfo(
        polysemyCode: json['polysemyCode'],
        definition: json['definition'],
        pOS: json['pOS'],
        hypornym: json['hypornym'],
        hypernym: json['hypernym'],
      );

  Map<String, dynamic> toJson() => {
        'polysemyCode': polysemyCode,
        'definition': definition,
        'pOS': pOS,
        'hypornym': hypornym,
        'hypernym': hypernym,
      };
}
