import 'package:flutter/material.dart';
import 'package:mantra/components/AllSongs/header.dart';
import 'package:mantra/components/AllSongs/musicList.dart';

class AllSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        MusicList(),
      ],
    );
  }
}
