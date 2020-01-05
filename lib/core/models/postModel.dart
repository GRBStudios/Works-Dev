class Trabajo {
  String id;
  String titulo;
  String descripcion;
  String archivo;
  String estado;
  String categoria;
  String googleToken;

  Trabajo(
      {this.id, this.titulo, this.descripcion, this.archivo, this.categoria, this.googleToken});

  Trabajo.fromMap(Map snapshot, String id)
      : id = id ?? '',
        titulo = snapshot['titulo'] ?? '',
        descripcion = snapshot['descripcion'] ?? '',
        categoria = snapshot['categoria'] ?? '',
      googleToken = snapshot['googleToken'] ?? '';


  toJson() {
    return {
      "titulo": titulo,
      "descripcion": descripcion,
      "categoria": categoria,
      "googleToken": googleToken
    };
  }
}
