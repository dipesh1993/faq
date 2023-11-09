class ModuleListResponse {
  ModuleListResponse({
    bool? status,
    String? message,
    List<Data>? data,
    num? statusCode,
    dynamic header,}){
    _status = status;
    _message = message;
    _data = data;
    _statusCode = statusCode;
    _header = header;
  }

  ModuleListResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _statusCode = json['statusCode'];
    _header = json['header'];
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
  num? _statusCode;
  dynamic _header;
  ModuleListResponse copyWith({  bool? status,
    String? message,
    List<Data>? data,
    num? statusCode,
    dynamic header,
  }) => ModuleListResponse(  status: status ?? _status,
    message: message ?? _message,
    data: data ?? _data,
    statusCode: statusCode ?? _statusCode,
    header: header ?? _header,
  );
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;
  num? get statusCode => _statusCode;
  dynamic get header => _header;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['statusCode'] = _statusCode;
    map['header'] = _header;
    return map;
  }

}

class Data {
  Data({
    num? id,
    String? appName,
    String? moduleName,
    String? status,}){
    _id = id;
    _appName = appName;
    _moduleName = moduleName;
    _status = status;
  }

  Data.fromJson(dynamic json) {
    _id = json['ID'];
    _appName = json['AppName'];
    _moduleName = json['ModuleName'];
    _status = json['Status'];
  }
  num? _id;
  String? _appName;
  String? _moduleName;
  String? _status;
  Data copyWith({  num? id,
    String? appName,
    String? moduleName,
    String? status,
  }) => Data(  id: id ?? _id,
    appName: appName ?? _appName,
    moduleName: moduleName ?? _moduleName,
    status: status ?? _status,
  );
  num? get id => _id;
  String? get appName => _appName;
  String? get moduleName => _moduleName;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = _id;
    map['AppName'] = _appName;
    map['ModuleName'] = _moduleName;
    map['Status'] = _status;
    return map;
  }

}