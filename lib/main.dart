import 'package:audio/screen/audioscreen.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Audioscareen(),
      },
    ),
  );
}