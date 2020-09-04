import 'dart:convert';

import 'package:KBook_IbrahimShehu/models/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, Book value) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.containsKey(key);
    prefs.setString(key, json.encode(value.toJson()));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<bool> isFavorite(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
