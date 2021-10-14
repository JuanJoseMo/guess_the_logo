import 'package:flutter/material.dart';
import 'package:guess_the_logo/src/providers/usuario_providers.dart';
import 'package:guess_the_logo/src/widgets/backgroundGame.dart';

class FormPutPage extends StatefulWidget {
  //final int intentos;
  //FormPutPage({this.intentos});

  @override
  _FormPutPageState createState() => _FormPutPageState();
}

class _FormPutPageState extends State<FormPutPage> {
  final _usuarioProvider = new UsuarioProvider();
  String _nombre = '';
  String _email = '';
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    final int intentos = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGame(),
          ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 2,
            ),
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text('Fin del juego',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                height: 25,
              ),
              _crearInputName(),
              SizedBox(
                height: 20,
              ),
              _userInputEmail(),
              SizedBox(
                height: 20,
              ),
              _userData(intentos),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 88.0,
                height: 50.0,
                buttonColor: Colors.black,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: RaisedButton(
                    color: Colors.white.withOpacity(0.8),
                    onPressed: () {
                      Navigator.of(context).pushNamed('home');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No subir la puntuación a la nube"),
                        SizedBox(width: 10),
                        Icon(Icons.cancel)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 88.0,
                height: 50.0,
                buttonColor: Colors.black,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: RaisedButton(
                    color: Colors.white.withOpacity(0.8),
                    onPressed: () {
                      _usuarioProvider.makePutRequest(
                          _nombre, _email, intentos);
                      Navigator.of(context).pushNamed('home');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Aceptar"),
                        SizedBox(width: 10),
                        Icon(Icons.done)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearInputName() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            //autofocus: true,
            textCapitalization:
                TextCapitalization.words, //Primera letra en mayúscula.
            decoration: InputDecoration(
              counter: Text('Letras: ${_nombre.length}'),
              hintText: 'Nombre de usuario',
              labelText: 'Nombre',
              helperText: 'Solo introducir nombre de usuario',
              suffixIcon: Icon(Icons.accessibility),
              icon: Icon(Icons.account_circle),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onChanged: (valor) {
              setState(() {
                _nombre = valor;
                print(_nombre);
                print(_nombre.length);
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _userInputEmail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            //autofocus: true,
            keyboardType:
                TextInputType.emailAddress, //Primera letra en mayúscula.
            decoration: InputDecoration(
              hintText: 'Correo Electrónico',
              labelText: 'Email',
              helperText: 'Introduzca su correo electrónico',
              suffixIcon: Icon(Icons.alternate_email),
              icon: Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onChanged: (valor) {
              setState(() {
                _email = valor;
                print(_nombre);
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _userData(int intentos) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text('El nombre es: $_nombre' +
                    '\nCorreo electrónico: $_email\n' +
                    'Has realizado ${intentos} intentos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
