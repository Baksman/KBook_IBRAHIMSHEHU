import 'package:KBook_IbrahimShehu/utils/shared_pref.dart';
import 'package:KBook_IbrahimShehu/models/book.dart';
import 'package:flutter/cupertino.dart';

class Favorite extends ChangeNotifier {
  // bool _isFavorite;
  SharedPref sharedPref = SharedPref();

  addToFavorite(String key, Book value) {
    sharedPref.save(key, value);
    notifyListeners();
    
  }

  unFavourite(String key) async {
    sharedPref.remove(key);
    notifyListeners();
  }

  isFavorite(String key) {
   return  sharedPref.isFavorite(key);
  }


}
