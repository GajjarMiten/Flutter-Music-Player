import 'package:flutter/material.dart';
import 'package:mantra/components/slideUpPanel.dart';
import 'package:mantra/providers/navigation.dart';
import 'package:mantra/screens/allSongs.dart';
import 'package:mantra/widgets/playerBar.dart';
import 'package:provider/provider.dart';

import 'components/navigationBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final navigationData = Provider.of<NavigationData>(context);
    return Scaffold(
      body: SafeArea(
        child: SlideUpPanel(
          body: PageView(
            controller: navigationData.controller,
            children: [AllSongs()],
          ),
          panel: PlayerBar(),
          panelChild: Center(
            child: Text(
              "data",
              style: TextStyle(fontSize: 40),
            ),
          ),
          duration: Duration(milliseconds: 100),
        ),
      ),
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
