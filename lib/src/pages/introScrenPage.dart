import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreenPage extends StatefulWidget {
  @override
  _IntroScreenPageState createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    
    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/imgCar.gif', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 20.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(5.0, 40.0, 15.0, 15.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Bienvenido",
          body: "Pulsa en siguiente para aprender a usar nuestra app",
          image: _buildImage('assets/imgCar.gif'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Para jugar",
          body:
              "Si pulsas sobre el botón de \"jugar\" podrás empezar a jugar y a adivinar las parejas que tenemos preparadas",
          image: _buildImage('assets/imgCar.gif'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Tus puntuaciones",
          body:
              "Si tú pulsas el botón de \"ranking\" te mostraremos un listado con tus mejores puntuaciones y intentos",
          image: _buildImage('assets/imgCar.gif'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Mas información sobre la app",
          body:
              "Si tú pulsas el botón de \"more\" te mostraremos información sobre nuestra app y sobre el desarrollador",
          image: _buildImage('assets/imgCar.gif'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fin",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Ya estas listo para comenzar!",
                style: bodyStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          image: _buildImage('assets/imgCar.gif'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Saltar tutorial'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Finalizar', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
