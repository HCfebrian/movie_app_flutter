import 'package:flutter/material.dart';
import 'package:movie_app_flutter/presentation/page/home_page.dart';
import 'dep_inject.dart'as di;

void main() {
  runApp(MyApp());
  di.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
