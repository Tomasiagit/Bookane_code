class Pacote{
  int? id;
  String? duracao;
  int? valor;

  Pacote(
      {this.id,
        this.duracao,
        this.valor,
      });

  Pacote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    duracao = json['duracao'];
    valor = json['valor'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['duracao'] = this.duracao;
    data['valor'] = this.valor;
    return data;
  }
}