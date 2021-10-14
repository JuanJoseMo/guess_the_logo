import 'package:flutter/material.dart';
import 'package:guess_the_logo/src/pages/introScrenPage.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/cupertino.dart';
import 'languages_screen.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageSettings(),
    );
  }
}

class PageSettings extends StatelessWidget {
  const PageSettings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double yourWidth = width * 0.75;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SettingsList(
          backgroundColor: Colors.white,
          sections: [
            SettingsSection(
              title: 'Ajustes',
              titleTextStyle: TextStyle(fontSize: 30),
              tiles: [
                SettingsTile(
                  title: 'Lenguaje',
                  subtitle: 'Español',
                  leading: Icon(Icons.language),
                  // ignore: deprecated_member_use
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LanguagesScreen()));
                  },
                ),
              ],
            ),
            SettingsSection(
              title: 'Tutorial',
              tiles: [
                SettingsTile(
                  title: 'Volver a ver el tutorial',
                  leading: Icon(Icons.android_sharp),
                  // ignore: deprecated_member_use
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => IntroScreenPage()));
                  },
                ),
              ],
            ),
            SettingsSection(
              title: 'Misceláneos',
              tiles: [
                SettingsTile(
                  title: 'Notificaciones',
                  leading: Icon(Icons.notifications),
                  // ignore: deprecated_member_use
                  onTap: () {
                    _showMyDialog(context);
                  },
                ),
                SettingsTile(
                  title: 'Términos de servicio y licencias de código abierto',
                  leading: Icon(Icons.description),
                  // ignore: deprecated_member_use
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Términos y condiciones'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.' +
                                    '\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n' +
                                    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n' +
                                    'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Aceptar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            CustomSection(
              child: Column(
                children: [
                  SizedBox(height: yourWidth),
                  Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 8),
                    child: Image.asset(
                      'assets/settings.png',
                      height: 50,
                      width: 50,
                      color: Color(0xFF777777),
                    ),
                  ),
                  Text(
                    'Versión: 1.0.0',
                    style: TextStyle(color: Color(0xFF777777)),
                  ),
                ],
              ),
            ),
          ],
        ),
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

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿Desea recibir notificaciones sobre próximos juegos?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Si desea recibir notificaciones sobre nuestros próximos lanzamientos solamente tiene que pulsar sobre aceptar.' +
                    '\nSi acepta recibirá notificaciones en su barra de estado.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
