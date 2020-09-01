import 'dart:convert';

import 'package:KBook_IbrahimShehu/models/book.dart';
import 'package:KBook_IbrahimShehu/repository/base_book_repository.dart';
import 'package:http/http.dart' as http;

import '../api_key.dart';

class BookRepository extends BaseBookRepository {
  static const baseUrl = "https://www.googleapis.com/books";
  static const int _perPage = 20;
  final http.Client _httpClient;
  List<Book> books = [];

  BookRepository({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  @override
  Future<List<Book>> getFlutterBooks({int startIndex}) async {
    String requestUrl =
        "$baseUrl/v1/volumes?q=Flutter&maxResults=$_perPage&startIndex=$startIndex&key=$APIKEY";

    try {
      http.Response response = await _httpClient.get(requestUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<Book> bookList = data["items"];
        bookList.forEach((book) {
          books.add(book);
        });
      }

      return books;
      
    } catch (e) {
      throw (e);
    }
  }

  @override
  void dispose() {
    _httpClient.close();
  }
}
