import 'dart:io';


import 'package:flutter/material.dart';

import 'package:mantra/helpers/Theme.dart';
import 'package:mantra/providers/songsProvider.dart';
import 'package:provider/provider.dart';

class MusicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final songsData = Provider.of<SongsProvider>(context);
    if (songsData.songs.isNotEmpty) {
      final songs = songsData.songs;
      return Expanded(
        child: ListView.builder(
          addAutomaticKeepAlives: true,
          itemCount: songs.length + 1,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index < songs.length) {
              final color = gradient[index % gradient.length];
              final song = songs[index];
              return ListTile(
                leading: Hero(
                  tag: song.title,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: color),
                      image: (song.albumArtwork != null)
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(song.albumArtwork)),
                            )
                          : DecorationImage(
                              image: AssetImage("assets/music_notes.png"),
                            ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                title: Text.rich(
                  TextSpan(
                    text: song.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Color(0xff706c61),
                    ),
                  ),
                  overflow: TextOverflow.ellipsis,
                  style: titleTextStyle,
                ),
                subtitle: Text.rich(
                  TextSpan(
                    text: song.artist,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                  overflow: TextOverflow.ellipsis,
                  style: titleTextStyle,
                ),
                trailing: Icon(Icons.favorite_border),
                onTap: () {
                  songsData.setCurrentSong(song);
                },
                onLongPress: () {},
              );
            } else {
              return SizedBox(
                height: 130,
              );
            }
          },
        ),
      );
    } else {
      return LinearProgressIndicator();
    }
  }
}
