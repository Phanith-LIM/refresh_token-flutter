class BaseModel {
  BaseModel({
    required this.status,
    this.message,
    this.data,
  });

  factory BaseModel.fromJson(dynamic json) {
    return BaseModel(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }

  final String status;
  String? message;
  dynamic data;
}
