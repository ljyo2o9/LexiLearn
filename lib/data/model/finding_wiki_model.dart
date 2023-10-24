class FindingWikiModel {
  String? requestId;
  int? result;
  ReturnObject? returnObject;

  FindingWikiModel({this.requestId, this.result, this.returnObject});

  FindingWikiModel.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    result = json['result'];
    returnObject = json['return_object'] != null
        ? ReturnObject.fromJson(json['return_object'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['request_id'] = requestId;
    data['result'] = result;
    if (returnObject != null) {
      data['return_object'] = returnObject!.toJson();
    }
    return data;
  }
}

class ReturnObject {
  WiKiInfo? wiKiInfo;

  ReturnObject({this.wiKiInfo});

  ReturnObject.fromJson(Map<String, dynamic> json) {
    wiKiInfo =
        json['WiKiInfo'] != null ? WiKiInfo.fromJson(json['WiKiInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wiKiInfo != null) {
      data['WiKiInfo'] = wiKiInfo!.toJson();
    }
    return data;
  }
}

class WiKiInfo {
  List<IRInfo>? iRInfo;
  List<AnswerInfo>? answerInfo;

  WiKiInfo({this.iRInfo, this.answerInfo});

  WiKiInfo.fromJson(Map<String, dynamic> json) {
    if (json['IRInfo'] != null) {
      iRInfo = <IRInfo>[];
      json['IRInfo'].forEach((v) {
        iRInfo!.add(IRInfo.fromJson(v));
      });
    }
    if (json['AnswerInfo'] != null) {
      answerInfo = <AnswerInfo>[];
      json['AnswerInfo'].forEach((v) {
        answerInfo!.add(AnswerInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (iRInfo != null) {
      data['IRInfo'] = iRInfo!.map((v) => v.toJson()).toList();
    }
    if (answerInfo != null) {
      data['AnswerInfo'] = answerInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IRInfo {
  String? wikiTitle;
  String? sent;
  String? url;

  IRInfo({this.wikiTitle, this.sent, this.url});

  IRInfo.fromJson(Map<String, dynamic> json) {
    wikiTitle = json['wiki_title'];
    sent = json['sent'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wiki_title'] = wikiTitle;
    data['sent'] = sent;
    data['url'] = url;
    return data;
  }
}

class AnswerInfo {
  int? rank;
  String? answer;
  int? confidence;
  List<String>? url;

  AnswerInfo({this.rank, this.answer, this.confidence, this.url});

  AnswerInfo.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    answer = json['answer'];
    confidence = json['confidence'];
    url = json['url'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rank'] = rank;
    data['answer'] = answer;
    data['confidence'] = confidence;
    data['url'] = url;
    return data;
  }
}
