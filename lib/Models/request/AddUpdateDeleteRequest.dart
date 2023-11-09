class AddUpdateDeleteRequest {
  AddUpdateDeleteRequest({
    String? qid,
    String? question,
    String? answer,
    String? module,
    String? status,
    String? createdBy,
    String? publishDate,
    String? flag,
  }) {
    _qid = qid;
    _question = question;
    _answer = answer;
    _module = module;
    _status = status;
    _createdBy = createdBy;
    _publishDate = publishDate;
    _flag = flag;
  }

  AddUpdateDeleteRequest.fromJson(dynamic json) {
    _qid = json['qid'];
    _question = json['question'];
    _answer = json['answer'];
    _module = json['module'];
    _status = json['status'];
    _createdBy = json['createdBy'];
    _publishDate = json['publishDate'];
    _flag = json['flag'];
  }

  String? _qid;
  String? _question;
  String? _answer;
  String? _module;
  String? _status;
  String? _createdBy;
  String? _publishDate;
  String? _flag;

  AddUpdateDeleteRequest copyWith({
    String? qid,
    String? question,
    String? answer,
    String? module,
    String? status,
    String? createdBy,
    String? publishDate,
    String? flag,
  }) =>
      AddUpdateDeleteRequest(
        qid: qid ?? _qid,
        question: question ?? _question,
        answer: answer ?? _answer,
        module: module ?? _module,
        status: status ?? _status,
        createdBy: createdBy ?? _createdBy,
        publishDate: publishDate ?? _publishDate,
        flag: flag ?? _flag,
      );

  String? get qid => _qid;

  String? get question => _question;

  String? get answer => _answer;

  String? get module => _module;

  String? get status => _status;

  String? get createdBy => _createdBy;

  String? get publishDate => _publishDate;

  String? get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['qid'] = _qid;
    map['question'] = _question;
    map['answer'] = _answer;
    map['module'] = _module;
    map['status'] = _status;
    map['createdBy'] = _createdBy;
    map['publishDate'] = _publishDate;
    map['flag'] = _flag;
    return map;
  }
}
