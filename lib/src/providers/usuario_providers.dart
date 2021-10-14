import 'dart:async';
import 'package:guess_the_logo/src/model/UsersModel.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  
  makePutRequest(String nombre, String email, int intentos) async {
    //Set up PUT request arguments
    String url = "http://---/juanjogame/index.php/Users/usuario";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"nombre": "$nombre", "email": "$email", "intentos": $intentos}';
    //Make PUT request
    http.Response response = await http.put(url, headers: headers, body: json);
    //Check the status code for the result
    int statusCode = response.statusCode;
    print("El estado es: $statusCode");
    //This API passes back the updated item with the id added
    String body = response.body;
  }

  // Devuelve el objeto completo de la peteción HTTP
  Future<List<Usuario>> cargarUsuarios() async {
    String url = 'http://---/juanjogame/index.php/Users/usuarios';
    //LLamo a la API con http
    final resp = await http.get(url);
    //Parseo la respuesta al objeto
    final listUsers = usuariosFromJson(resp.body);
    //Devuelvo el objeto
    return listUsers.usuarios;
  }
}
