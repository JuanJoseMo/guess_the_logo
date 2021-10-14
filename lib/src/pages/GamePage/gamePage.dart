import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:guess_the_logo/src/widgets/backgroundGame.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

bool flagGiro1 = true;
bool flagGiro2 = true;
bool flagGiro3 = true;
bool flagGiro4 = true;
bool flagGiro5 = true;
bool flagGiro6 = true;
bool flagGiro7 = true;
bool flagGiro8 = true;
bool flagGiro9 = true;
bool flagGiro10 = true;
bool flagGiro11 = true;
bool flagGiro12 = true;
bool flagGiro13 = true;

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackgroundGame(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Puntuación',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              _addConjuntoBotones(context, 1, 2, 5, 1, flagGiro1, flagGiro2,
                  flagGiro3, flagGiro4),
              _addConjuntoBotones(context, 5, 7, 7, 8, flagGiro5, flagGiro6,
                  flagGiro7, flagGiro8),
              _addConjuntoBotones(context, 2, 8, 12, 12, flagGiro9, flagGiro10,
                  flagGiro11, flagGiro12),
            ],
          ),
        ],
      ),
    );
  }

  Widget _addConjuntoBotones(
    BuildContext context,
    int numCard1,
    int numCard2,
    int numCard3,
    int numCard4,
    bool flagGiro1,
    bool flagGiro2,
    bool flagGiro3,
    bool flagGiro4,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CrearBtn(
          context: context,
          numCard: numCard1,
          giro: flagGiro1,
        ),
        CrearBtn(
          context: context,
          numCard: numCard2,
          giro: flagGiro2,
        ),
        CrearBtn(
          context: context,
          numCard: numCard3,
          giro: flagGiro3,
        ),
        CrearBtn(
          context: context,
          numCard: numCard4,
          giro: flagGiro4,
        ),
      ],
    );
  }
}

class CrearBtn extends StatelessWidget {
  final BuildContext context;
  final int numCard;
  final bool giro;
  CrearBtn({@required this.numCard, @required this.context, @required this.giro});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: CircleAvatar(
        backgroundColor: Colors.yellow,
        radius: 35,
        child: Image(
          image: AssetImage('assets/hidden.png'),
        ),
      ),
      back: CircleAvatar(
        backgroundColor: Colors.yellow,
        radius: 35,
        child: Image(
          image: AssetImage('assets/emblems/${numCard}.png'),
        ),
      ),
      flipOnTouch: giro,
      onFlip: () {
        print('Has pulsa la carta $numCard');
      },
    );
  }
}
