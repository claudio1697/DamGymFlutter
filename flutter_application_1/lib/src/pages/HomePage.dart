import 'package:flutter/material.dart';
import 'dart:async';

class HomePagee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, 'calendarioPantalla');
    });

    /* new Future.delayed(
      Duration(
        seconds: 5,
      ),
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => calen())); */

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/src/img/imgPantallaInicial.jpg"),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
