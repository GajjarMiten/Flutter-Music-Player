

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class NavigationData with ChangeNotifier{

  int _index = 0;

  final PageController _controller = PageController(initialPage: 0);

  int get getIndex => _index;
  PageController get controller => _controller;

  void setIndex(int value){
    _index = value;
    notifyListeners();
  }


}