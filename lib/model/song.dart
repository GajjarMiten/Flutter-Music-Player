import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:hive/hive.dart';

part 'song.g.dart';


@HiveType(typeId: 1)
class Song extends HiveObject{

  @HiveField(0)
  final String albumId;
  
  @HiveField(1) 
  final String artistId;
  
  @HiveField(2) 
  final String artist;
  
  @HiveField(3) 
  final String album;
  
  @HiveField(4) 
  final String title;
  
  @HiveField(5) 
  final String displayName;
  
  @HiveField(6) 
  final String duration;
  
  @HiveField(7) 
  final String filePath;
  
  @HiveField(8) 
  final String fileSize;
  
  @HiveField(9) 
  final String albumArtwork;

  Song(
      {this.albumId,
      this.artistId,
      this.artist,
      this.album,
      this.title,
      this.displayName,
      this.duration,
      this.filePath,
      this.fileSize,
      this.albumArtwork});

  factory Song.fromSongInfo(SongInfo song) {
    return Song(
      album: song.album,
      albumId: song.albumId,
      artist: song.artist,
      albumArtwork: song.albumArtwork,
      artistId: song.artistId,
      displayName: song.displayName,
      duration: song.duration,
      filePath: song.filePath,
      fileSize: song.fileSize,
      title: song.title,
    );
  }
}
