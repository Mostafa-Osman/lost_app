class UserDataModel {
  final UserData data;
  final String message;
  final int status;

  UserDataModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as int,
    );
  }
}

class UserData {
  final String email;
  final int id;
  final String phoneNumber;
  final String username;
  final String? token;

  UserData({
    required this.email,
    required this.id,
    required this.phoneNumber,
    required this.username,
    this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] as int,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      username: json['username'] as String,
      token: json['token'] as String,
    );
  }
}
