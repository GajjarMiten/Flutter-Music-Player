import 'package:flutter/material.dart';
import 'package:mantra/homepage.dart';
import 'package:mantra/providers/navigation.dart';
import 'package:mantra/providers/songsProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavigationData()),
          ChangeNotifierProvider(create: (_) => SongsProvider()),
        ],
        child: HomePage(),
      ),
    );
  }
}
