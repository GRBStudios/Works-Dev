class Perfil {
  String id;
  String nombre;
  String apellido;
  String tipoUsuario;
  String googleToken;

  Perfil(
      {this.id,
      this.nombre,
      this.apellido,
      this.tipoUsuario,
      this.googleToken});

  Perfil.fromMap(Map snapshot, String id)
      : id = id ?? '',
        googleToken = snapshot['googleToken'] ?? '',
        nombre = snapshot['nombre'] ?? '',
        apellido = snapshot['apellido'] ?? '',
        tipoUsuario = snapshot['tipoUsuario'] ?? '';

  toJson() {
    return {
      "googleToken": googleToken,
      "nombre": nombre,
      "apellido": apellido,
      "tipoUsuario": tipoUsuario,
    };
  }
}
