import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/background.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
