import 'package:flutter/material.dart';
import 'package:mantra/model/song.dart';
import 'package:mantra/providers/songsProvider.dart';
import 'package:provider/provider.dart';

class PlayerBar extends StatefulWidget {
  @override
  _PlayerBarState createState() => _PlayerBarState();
}

class _PlayerBarState extends State<PlayerBar> {
  @override
  Widget build(BuildContext context) {
    final songsData = Provider.of<SongsProvider>(context);
    final song = songsData.songBox?.get("currentSong",defaultValue: Song(title: " "));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(song?.title??" ",
              softWrap: true, overflow: TextOverflow.ellipsis),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        )
      ],
    );
  }
}
