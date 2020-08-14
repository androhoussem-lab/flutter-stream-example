import 'package:flutter/material.dart';

import 'home_screen.dart';

main(){
  runApp(StreamApp());
}
class StreamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      title: 'Stream App',
      home: HomeScreen(),
    );
  }
}
