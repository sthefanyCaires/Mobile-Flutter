class Mercadoria {
  int id;
  String nome;
  int quantidade;
 
  Mercadoria(this.nome, this.quantidade);
 
  Mercadoria.fromMap(Map map) {
    this.id = map["id"];
    this.nome = map["nome"];
    this.quantidade = map["quantidade"];
  }
 
  Map toMap() {
    Map<String, dynamic> map = {
      "nome": this.nome,
      "quantidade": this.quantidade,
    };
 
    if (this.id != null) {
      map["id"] = this.id;
    }
 
    return map;
  }
}
