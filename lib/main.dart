import 'package:flutter/material.dart';

import 'CustomClipTest.dart';
import 'Demo5.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: WaveAnimation(),
      //home: DemoPage(),
    );
  }
}


