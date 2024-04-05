class Profile {
  int? id;
  String? fullName;
  String? email;
  String? emailVerifiedAt;
  String? classId;
  String? roleId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Profile(
      {this.id,
      this.fullName,
      this.email,
      this.emailVerifiedAt,
      this.classId,
      this.roleId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    classId = json['class_id'];
    roleId = json['role_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['class_id'] = this.classId;
    data['role_id'] = this.roleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
