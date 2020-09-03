import 'dart:convert';

import 'package:KBook_IbrahimShehu/models/book.dart';
import 'package:KBook_IbrahimShehu/repository/base_book_repository.dart';

import 'package:http/http.dart' as http;

import '../api_key.dart';

class BookRepository extends BaseBookRepository {
  static const baseUrl = "https://www.googleapis.com/books";
  static const int perPage = 20;
  final http.Client _httpClient;
  List<Book> books = [];

  BookRepository({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  @override
  Future<List<Book>> getFlutterBooks({int startIndex}) async {
    String requestUrl =
        "$baseUrl/v1/volumes?q=Flutter&maxResults=$perPage&startIndex=$startIndex&key=$APIKEY";

    try {
      http.Response response = await _httpClient.get(requestUrl);
      print("status code is ${response.statusCode}");
      if (response.statusCode == 200) {
        Map<dynamic, dynamic> data = json.decode(response.body);
        // print(data);
        List bookList = data["items"] ;

        // Map eachmap = bookList[0] as Map;
        // print("the datas are $bookList");
        bookList.forEach((book) {
          // print("$book \n \n");

          books.add(Book.fromJson(book));
        });
      }

      print("i got here");
      // print(books);
      print(books);
      return books;
    } catch (e, s) {
      print(e);
      throw (e);
    }
  }

  @override
  void dispose() {
    _httpClient.close();
  }
}
