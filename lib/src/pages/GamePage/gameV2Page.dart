import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:guess_the_logo/src/pages/GamePage/formPutPage.dart';
import 'package:guess_the_logo/src/widgets/backgroundGame.dart';

class GameV2Page extends StatefulWidget {
  @override
  _GameV2PageState createState() => _GameV2PageState();
}

class _GameV2PageState extends State<GameV2Page> {
  //Listas de keys de las flips cards que vamos a ir creando
  List<GlobalKey<FlipCardState>> cardStatesKey = [
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
    GlobalKey<FlipCardState>(),
  ];
  //Giro de la carta comenzara en true para asi poder girarla.
  List<bool> cardFlips = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ];
  //Numero que va a ser el "nombre".png de nuestra imagen en assets
  List<int> numCardImg = [
    1,
    2,
    5,
    1,
    5,
    7,
    8,
    7,
    2,
    8,
    12,
    12,
    9,
    10,
    11,
    9,
    10,
    11,
    14,
    14,
  ];
  int puntuacion = 0;
  int intentos = 0;
  int imgAnterior = -1;
  bool flip = false;

  @override
  void initState() {
    super.initState();
    //Hacemos que nuestra lista de numeros correspondientes a las imagenes se cambien de posicion aleatoriamente
    numCardImg.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGame(),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                /*
                  child: Text(
                    (time == 0) ? 'Contador de tiempo:' : '$time',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),*/
                child: Text('Puntuación: $puntuacion',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  //Número total de CircleAvatar que vamos a encontrar por fila
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlipCard(
                      key: cardStatesKey[index],
                      onFlip: () {
                        if (!flip) {
                          flip = true;
                          imgAnterior = index;
                        } else {
                          //En este caso significa que hemos dado la vuelta a una o dos cartas, con lo que tendremos que comprobarlo
                          flip = false;
                          if (imgAnterior != index) {
                            if (numCardImg[imgAnterior] != numCardImg[index]) {
                              cardStatesKey[imgAnterior]
                                  .currentState
                                  .toggleCard();
                              imgAnterior = index;
                              setState(() {
                                intentos += 1;
                                print(intentos);
                              });
                            } else {
                              //Hemos encontrado una pareja de emblemas
                              cardFlips[imgAnterior] = false;
                              cardFlips[index] = false;
                              print("Cartas iguales!");
                              setState(() {
                                puntuacion += 25;
                                intentos += 1;
                                print(intentos);
                              });
                              if (cardFlips.every((t) => t == false)) {
                                print('Has ganado!');
                                showResult();
                              }
                            }
                          }
                        }
                      },
                      flipOnTouch: cardFlips[index],
                      direction: FlipDirection.VERTICAL,
                      front: CircleAvatar(
                        backgroundColor: Colors.yellow.withOpacity(0.8),
                        radius: 35,
                        child: Image(
                          image: AssetImage('assets/hidden.png'),
                        ),
                      ),
                      back: CircleAvatar(
                        backgroundColor: Colors.yellow.withOpacity(0.8),
                        radius: 35,
                        child: Image(
                          image: AssetImage(
                              'assets/emblems/${numCardImg[index]}.png'),
                        ),
                      ),
                    ),
                  ),
                  //Total de CircleAvatar
                  itemCount: 20,
                ),
              )

            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

  showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        elevation: 8.0,
        title: Text('Has ganado!!'),
        content: Text('Tu puntuación ha sido de: $puntuacion\n' +
            'Has realizado $intentos intentos'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, 'formPut', arguments: intentos);
            },
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }
}
