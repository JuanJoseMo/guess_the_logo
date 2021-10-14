import 'package:flutter/material.dart';
import 'package:guess_the_logo/src/model/UsersModel.dart';
import 'package:guess_the_logo/src/providers/usuario_providers.dart';
import 'package:guess_the_logo/src/widgets/background.dart';

class RankingPage extends StatelessWidget {
  final _usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Text('Ranking de usuarios por intentos',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: FutureBuilder<List<Usuario>>(
              initialData: [],
              future: _usuarioProvider.cargarUsuarios(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Usuario>> snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Itemlista(
                      user: snapshot.data[i],
                      i: i,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.of(context).pushNamed('home');
        },
        label: Text('Atrás'),
        icon: Icon(Icons.arrow_back),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class Itemlista extends StatelessWidget {
  final Usuario user;
  final int i;
  Itemlista({this.user, this.i});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Container(
              color: Colors.white.withOpacity(0.6),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                title: Text(
                  "${i + 1}. ${user.nombre}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "Correo electrónico proporcionado por el usuario: "),
                      TextSpan(
                          text: "${user.email}\n",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              "Número de intentos realizados para completar el juego: "),
                      TextSpan(
                          text: '${user.intentos}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
