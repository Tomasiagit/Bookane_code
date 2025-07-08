class Profile {
  int? id;
  String? name;
  String? email;
  int ? role_id;

  Profile(
      {this.id,
      this.name,
      this.email,
        this.role_id
      });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role_id = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role_id'] = this.role_id;
    return data;
  }
}
