class UserModel {
  String? uid;
  String? name;
  String? email;
 // String? classe;


  UserModel(
      {this.uid,
        this.name,
        this.email,
       // this.classe,

     });

  UserModel.fromJson(Map<String, dynamic> map) {
    uid = map['uid'];
    name = map['name'];
    email = map['email'];
    //classe = map['classe'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['email'] = this.email;
   // data['classe'] = this.classe;
    return data;
  }


}
