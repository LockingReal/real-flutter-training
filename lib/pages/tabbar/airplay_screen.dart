import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AirplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          centerTitle: true,
          title: Text('AIRPLAY'),
        ),
        body:Center(
          child: Text('AIRPLAY'),
        )
    );
  }
}