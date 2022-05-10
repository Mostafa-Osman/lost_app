class RegisterModel {
  final RegisterData data;
  final String message;
  final int status;

  RegisterModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      data: RegisterData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      status: json['status'] as int,
    );
  }
}

class RegisterData {
  final String email;
  final int id;
  final String phoneNumber;
  final String username;

  RegisterData({
    required this.email,
    required this.id,
    required this.phoneNumber,
    required this.username,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      id: json['id'] as int,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      username: json['username'] as String,
    );
  }
}
