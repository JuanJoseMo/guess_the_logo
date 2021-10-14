import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BackgroundGame extends StatefulWidget {
  @override
  _BackgroundGameState createState() => _BackgroundGameState();
}

class _BackgroundGameState extends State<BackgroundGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/bgGame.gif'),
        fit: BoxFit.cover,
      ),
    );
  }
}
