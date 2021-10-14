import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:guess_the_logo/src/widgets/background.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Padding(
            padding: const EdgeInsets.only(left: 55, top: 50),
            child: SizedBox(
              width: 250,
              height: 250,
              child: Image(
                image: AssetImage('assets/imgCar.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Image(
                image: AssetImage('assets/buttons/btPlayGame.png'),
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                  'game');
              print('Has pulsado Jugar.');
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Image(
                image: AssetImage('assets/buttons/btRanking.png'),
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                  'ranking');
              print('Has pulsado Ranking.');
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(top: 500),
              child: Image(
                image: AssetImage('assets/buttons/btMore.png'),
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                  'more');
              print('Has pulsado More.');
            },
          ),
        ],
      ),
    );
  }
}
