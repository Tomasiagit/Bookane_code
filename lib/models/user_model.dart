class UserModel {
  String? uid;
  String? nome;
  String? email;
  String? classe;


  UserModel(
      {this.uid,
        this.nome,
        this.email,
        this.classe,

     });

  UserModel.fromJson(Map<String, dynamic> map) {
    uid = map['uid'];
    nome = map['nome'];
    email = map['email'];
    classe = map['classe'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['classe'] = this.classe;
    return data;
  }


}
