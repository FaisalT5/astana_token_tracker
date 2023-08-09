import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class countProvider with ChangeNotifier{
  int _count = 0;
  get count => _count;

  void setCount() {

      _count++;
      notifyListeners();
  }

  void dectCount() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }

  void resetCount(){
    _count = 0;
    notifyListeners();
  }

}

