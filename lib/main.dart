import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/services.dart';

import 'src/app.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations(
    // Con esto conseguiremos que la aplicación no disponga de rotación.
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}
