import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:guess_the_logo/src/pages/GamePage/gameV2Page.dart';
import 'package:guess_the_logo/src/pages/GamePage/formPutPage.dart';
import 'pages/introScrenPage.dart';
import 'pages/splashScreen.dart';
import 'pages/homePage.dart';
import 'pages/PageMoreInfo/morePage.dart';
import 'pages/RankingPage/rankingPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adivina coches',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        fontFamily: 'Yusei',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        '/': (BuildContext context) => SplashScreen(),
        'tutorial': (BuildContext context) => IntroScreenPage(),
        'home': (BuildContext context) => HomePage(),
        //'game': (BuildContext context) => GamePage(),
        'game': (BuildContext context) => GameV2Page(),
        'ranking': (BuildContext context) => RankingPage(),
        'more': (BuildContext context) => MorePage(),
        'formPut': (BuildContext context) => FormPutPage(),
      },
    );
  }
}
