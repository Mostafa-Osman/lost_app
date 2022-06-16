class NotificationModel {
  String? message;
  String? postPhoto;
  String? title;
  String? userPhoto;

//<editor-fold desc="Data Methods">

  NotificationModel({
    this.message,
    this.postPhoto,
    this.title,
    this.userPhoto,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationModel &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          postPhoto == other.postPhoto &&
          title == other.title &&
          userPhoto == other.userPhoto);

  @override
  int get hashCode =>
      message.hashCode ^
      postPhoto.hashCode ^
      title.hashCode ^
      userPhoto.hashCode;

  @override
  String toString() {
    return 'NotificationModel{ message: $message, postPhoto: $postPhoto, title: $title, userPhoto: $userPhoto,}';
  }

  NotificationModel copyWith({
    String? message,
    String? postPhoto,
    String? title,
    String? userPhoto,
  }) {
    return NotificationModel(
      message: message ?? this.message,
      postPhoto: postPhoto ?? this.postPhoto,
      title: title ?? this.title,
      userPhoto: userPhoto ?? this.userPhoto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': this.message,
      'postPhoto': this.postPhoto,
      'title': this.title,
      'userPhoto': this.userPhoto,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      message: map['msg'] as String?,
      postPhoto: map['post_photo'] as String?,
      title: map['title'] as String?,
      userPhoto: map['user_photo'] as String?,
    );
  }

//</editor-fold>
}
