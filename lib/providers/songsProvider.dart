import 'package:flutter/foundation.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mantra/model/song.dart';

class SongsProvider with ChangeNotifier {
  List<SongInfo> _songs = [];
  SongInfo _currentSong;

  Box<Song> _songBox;

  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  SongsProvider() {
    fatchAllSong();
    initHive();
  }

  Future<List<SongInfo>> fatchAllSong() async {
    _songs = await audioQuery.getSongs();
    notifyListeners();
    return _songs;
  }

  void initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SongAdapter());
    _songBox = await Hive.openBox<Song>("Songs");
    notifyListeners();
  }

  void setCurrentSong(SongInfo song) {
    _currentSong = song;
    _songBox.put("currentSong",Song.fromSongInfo(song));
    notifyListeners();
  }




  List<SongInfo> get songs => _songs;
  SongInfo get currentSong => _currentSong;
  Box<Song> get songBox => _songBox;
}
