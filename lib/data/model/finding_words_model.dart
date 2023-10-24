class FindingWordsModel {
  String? requestId;
  int? result;
  String? returnType;
  ReturnObject? returnObject;

  FindingWordsModel({
    this.requestId,
    this.result,
    this.returnType,
    this.returnObject,
  });

  factory FindingWordsModel.fromJson(Map<String, dynamic> json) {
    return FindingWordsModel(
      requestId: json['request_id'],
      result: json['result'],
      returnType: json['return_type'],
      returnObject: json['return_object'] != null
          ? ReturnObject.fromJson(json['return_object'])
          : null,
    );
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

  ReturnObject({
    this.metaInfo,
    this.wWNWordInfo,
  });

  factory ReturnObject.fromJson(Map<String, dynamic> json) {
    return ReturnObject(
      metaInfo:
          json['MetaInfo'] != null ? MetaInfo.fromJson(json['MetaInfo']) : null,
      wWNWordInfo: (json['WWN WordInfo'] as List<dynamic>?)
          ?.map((v) => WWNWordInfo.fromJson(v))
          .toList(),
    );
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

  MetaInfo({
    this.title,
    this.link,
  });

  factory MetaInfo.fromJson(Map<String, dynamic> json) {
    return MetaInfo(
      title: json['Title'],
      link: json['Link'],
    );
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

  WWNWordInfo({
    this.word,
    this.homonymCode,
    this.wordInfo,
    this.synonym,
    this.antonym,
  });

  factory WWNWordInfo.fromJson(Map<String, dynamic> json) {
    return WWNWordInfo(
      word: json['Word'],
      homonymCode: json['HomonymCode'],
      wordInfo: (json['WordInfo'] as List<dynamic>?)
          ?.map((v) => WordInfo.fromJson(v))
          .toList(),
      synonym: (json['Synonym'] as List<dynamic>?)?.cast<String>(),
      antonym: (json['Antonym'] as List<dynamic>?)?.cast<String>(),
    );
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

  WordInfo({
    this.polysemyCode,
    this.definition,
    this.pOS,
    this.hypernym,
    this.hypornym,
  });

  factory WordInfo.fromJson(Map<String, dynamic> json) {
    return WordInfo(
      polysemyCode: json['PolysemyCode'],
      definition: json['Definition'],
      pOS: json['POS'],
      hypernym: (json['Hypernym'] as List<dynamic>?)?.cast<String>(),
      hypornym: (json['Hypornym'] as List<dynamic>?)?.cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PolysemyCode'] = polysemyCode;
    data['Definition'] = definition;
    data['POS'] = pOS;
    data['Hypernym'] = hypernym;
    data['Hypornym'] = hypornym;
    return data;
  }
}
