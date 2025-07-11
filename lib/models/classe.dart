class Classe {
  int? id;
  String? classe;

  Classe(
      {this.id,
        this.classe,
      });
  Classe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classe = json['classe'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['classe'] = this.classe;
    return data;
  }
  }