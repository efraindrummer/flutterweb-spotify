
import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class CurentTrackModel extends ChangeNotifier {
  Song? selected;

  void selectedTrack(Song track){
    selected = track;
    notifyListeners();
  }
}