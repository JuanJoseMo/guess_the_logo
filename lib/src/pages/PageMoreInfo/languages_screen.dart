import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  int languageIndex = 0;
  static const Color transparent = Color(0x00000000);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Lenguajes')),
        body: Stack(
          children: [
            SettingsList(
              shrinkWrap: true,
              sections: [
                SettingsSection(tiles: [
                  SettingsTile(
                    title: "Español",
                    trailing: trailingWidget(0),
                    onTap: () {
                      changeLanguage(0);
                    },
                  ),
                  SettingsTile(
                    title: "Inglés",
                    trailing: trailingWidget(1),
                    onTap: () {
                      changeLanguage(1);
                    },
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? Icon(Icons.check, color: Colors.blue)
        : Icon(null);
  }

  void changeLanguage(int index) {
    setState(() {
      languageIndex = index;
    });
  }
}
