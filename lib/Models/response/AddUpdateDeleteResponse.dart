class AddUpdateDeleteResponse {
  AddUpdateDeleteResponse({
    bool? status,
    String? message,
    Data? data,
    num? statusCode,
    dynamic header,
  }) {
    _status = status;
    _message = message;
    _data = data;
    _statusCode = statusCode;
    _header = header;
  }

  AddUpdateDeleteResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _statusCode = json['statusCode'];
    _header = json['header'];
  }

  bool? _status;
  String? _message;
  Data? _data;
  num? _statusCode;
  dynamic _header;

  AddUpdateDeleteResponse copyWith({
    bool? status,
    String? message,
    Data? data,
    num? statusCode,
    dynamic header,
  }) =>
      AddUpdateDeleteResponse(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
        statusCode: statusCode ?? _statusCode,
        header: header ?? _header,
      );

  bool? get status => _status;

  String? get message => _message;

  Data? get data => _data;

  num? get statusCode => _statusCode;

  dynamic get header => _header;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['statusCode'] = _statusCode;
    map['header'] = _header;
    return map;
  }
}

class Data {
  Data({
    List<Success>? success,
    List<Data>? data,
  }) {
    _success = success;
    _data = data;
  }

  Data.fromJson(dynamic json) {
    if (json['Success'] != null) {
      _success = [];
      json['Success'].forEach((v) {
        _success?.add(Success.fromJson(v));
      });
    }
    if (json['Data'] != null) {
      _data = [];
      json['Data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  List<Success>? _success;
  List<Data>? _data;

  Data copyWith({
    List<Success>? success,
    List<Data>? data,
  }) =>
      Data(
        success: success ?? _success,
        data: data ?? _data,
      );

  List<Success>? get success => _success;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_success != null) {
      map['Success'] = _success?.map((v) => v.toJson()).toList();
    }
    if (_data != null) {
      map['Data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
//
// class Data {
//   Data({
//       num? qid,
//       String? question,
//       String? answer,
//       String? module,
//       String? status,
//       String? createDate,
//       String? createdBy,
//       String? publishDate,}){
//     _qid = qid;
//     _question = question;
//     _answer = answer;
//     _module = module;
//     _status = status;
//     _createDate = createDate;
//     _createdBy = createdBy;
//     _publishDate = publishDate;
// }
//
//   Data.fromJson(dynamic json) {
//     _qid = json['QID'];
//     _question = json['Question'];
//     _answer = json['Answer'];
//     _module = json['Module'];
//     _status = json['Status'];
//     _createDate = json['CreateDate'];
//     _createdBy = json['CreatedBy'];
//     _publishDate = json['PublishDate'];
//   }
//   num? _qid;
//   String? _question;
//   String? _answer;
//   String? _module;
//   String? _status;
//   String? _createDate;
//   String? _createdBy;
//   String? _publishDate;
// Data copyWith({  num? qid,
//   String? question,
//   String? answer,
//   String? module,
//   String? status,
//   String? createDate,
//   String? createdBy,
//   String? publishDate,
// }) => Data(  qid: qid ?? _qid,
//   question: question ?? _question,
//   answer: answer ?? _answer,
//   module: module ?? _module,
//   status: status ?? _status,
//   createDate: createDate ?? _createDate,
//   createdBy: createdBy ?? _createdBy,
//   publishDate: publishDate ?? _publishDate,
// );
//   num? get qid => _qid;
//   String? get question => _question;
//   String? get answer => _answer;
//   String? get module => _module;
//   String? get status => _status;
//   String? get createDate => _createDate;
//   String? get createdBy => _createdBy;
//   String? get publishDate => _publishDate;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['QID'] = _qid;
//     map['Question'] = _question;
//     map['Answer'] = _answer;
//     map['Module'] = _module;
//     map['Status'] = _status;
//     map['CreateDate'] = _createDate;
//     map['CreatedBy'] = _createdBy;
//     map['PublishDate'] = _publishDate;
//     return map;
//   }
//
// }

class Success {
  Success({
    String? responce,
  }) {
    _responce = responce;
  }

  Success.fromJson(dynamic json) {
    _responce = json['responce'];
  }

  String? _responce;

  Success copyWith({
    String? responce,
  }) =>
      Success(
        responce: responce ?? _responce,
      );

  String? get responce => _responce;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responce'] = _responce;
    return map;
  }
}
