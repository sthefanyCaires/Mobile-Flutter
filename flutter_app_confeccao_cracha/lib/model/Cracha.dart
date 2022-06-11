class Cracha {
  int id;
  String nome;
  String area;
  String foto;
 
  Cracha(this.nome, this.area, this.foto);
 
  Cracha.fromMap(Map map) {
    this.id = map["id"];
    this.nome = map["nome"];
    this.area = map["area"];
    this.foto = map["foto"];
  }
 
  Map toMap() {
    Map<String, dynamic> map = {
      "nome": this.nome,
      "area": this.area,
      "foto": this.foto,
    };
 
    if (this.id != null) {
      map["id"] = this.id;
    }
 
    return map;
  }
}
