class Livro{

  int? id;
  String? disciplina;
  int? classe_id;
  String? classe;
  String? arquivo;
  String? capa;


  Livro(
      {this.id,
        this.disciplina,
        this.classe_id,
        this.classe,
        this.arquivo,
        this.capa
      });
  Livro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    disciplina = json['disciplina'];
    classe_id = json['classe_id'];
    classe = json['classe'];
    arquivo = json['arquivo'];
    capa = json['capa'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['disciplina'] = this.disciplina;
    data['classe_id'] = this.classe_id;
    data['classe'] = this.classe;
    data['arquivo'] = this.arquivo;
    data['capa'] = this.capa;
    return data;
  }

}