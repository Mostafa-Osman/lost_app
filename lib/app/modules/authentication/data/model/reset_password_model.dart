class ResetPasswordModel {
  final Data data;
  final String message;
  final int status;

  ResetPasswordModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as int,
    );
  }
}

class Data {
  final bool isRegistered;
  final String username;

  Data({
    required this.isRegistered,
    required this.username,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      isRegistered: json['is_registered'] as bool,
      username: json['username'] as String,
    );
  }
}
