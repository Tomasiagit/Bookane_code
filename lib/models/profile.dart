class Profile {
  int? id;
  String? name;
  String? email;
  String? role_id;
 // String? emailVerifiedAt;
//  String? classId;
  // String? createdAt;
  // String? updatedAt;
  // String? deletedAt;

  Profile(
      {this.id,
      this.name,
      this.email,
        this.role_id,
      // this.emailVerifiedAt,
      // this.classId,
      // this.createdAt,
      // this.updatedAt,
      // this.deletedAt
      });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role_id = json['role_id'];
    // emailVerifiedAt = json['email_verified_at'];
    // classId = json['class_id'];
    //
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role_id'] = this.role_id;
    // data['email_verified_at'] = this.emailVerifiedAt;
    // data['class_id'] = this.classId;
    // data['role_id'] = this.roleId;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    // data['deleted_at'] = this.deletedAt;
    return data;
  }
}
