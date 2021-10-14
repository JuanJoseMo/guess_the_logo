import 'dart:convert';

Usuarios usuariosFromJson(String str) => Usuarios.fromJson(json.decode(str));

String usuariosToJson(Usuarios data) => json.encode(data.toJson());

class Usuarios {
    Usuarios({
        this.err,
        this.mensaje,
        this.totalRegistros,
        this.usuarios,
    });

    bool err;
    String mensaje;
    int totalRegistros;
    List<Usuario> usuarios;

    factory Usuarios.fromJson(Map<String, dynamic> json) => Usuarios(
        err: json["err"],
        mensaje: json["mensaje"],
        totalRegistros: json["total_registros"],
        usuarios: List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "err": err,
        "mensaje": mensaje,
        "total_registros": totalRegistros,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
    };
}

class Usuario {
    Usuario({
        this.nombre,
        this.email,
        this.intentos,
    });

    String nombre;
    String email;
    String intentos;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        email: json["email"],
        intentos: json["intentos"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "email": email,
        "intentos": intentos,
    };
}
