import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
      
  @override
  void afterFirstLayout(BuildContext context) => _cuentaAtras();

  _cuentaAtras() async {
    var duracion = Duration(seconds: 2);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool flagTuto = (prefs.getBool('flagTuto') ?? false);

    if (flagTuto == true)
      return Timer(duracion, () {
        Navigator.pushReplacementNamed(context, 'home');
      });
    else
      return Timer(duracion, () async {
        await prefs.setBool('flagTuto', true);
        Navigator.pushReplacementNamed(context, 'tutorial');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Colors.white,
              height: double.infinity,
              width: double.infinity,
              child: _imagenFondo(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.5),
                Expanded(
                  child: Container(),
                ),
                Text(
                  'Adivina Coches',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    'v1.0.0',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        height: 25,
        width: 25,
        image: AssetImage('assets/imgCar.gif'),
      ),
    );
  }
}
