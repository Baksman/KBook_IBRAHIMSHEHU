import 'package:KBook_IbrahimShehu/models/book.dart';

abstract class BaseBookRepository {
  Future <List<Book>> getFlutterBooks ({int startIndex});

  void dispose();
}
