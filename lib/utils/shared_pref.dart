import 'dart:convert';
import 'package:KBook_IbrahimShehu/models/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<Book> read(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return Book.fromStorage(json.decode(prefs.getString(key)));
  }

  save(String key, Book value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value.toJson()));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<List<Book>> getAllFavorites() async {
    List<Book> books = [];
    final prefs = await SharedPreferences.getInstance();
    for (var k in prefs.getKeys().toList()) {
      books.add(await read(k));
    }
    return books;
  }

  Future<bool> isFavorite(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
