import 'dart:async';

import 'package:KBook_IbrahimShehu/models/book.dart';
import 'package:KBook_IbrahimShehu/repository/book_repository.dart';
import 'package:KBook_IbrahimShehu/utils/shared_pref.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository _bookRepository = BookRepository();
  SharedPref _sharedPref = SharedPref();
  BookBloc({BookRepository bookRepository}) : super(BookEmptyState());
  @override
  Stream<BookState> mapEventToState(
    BookEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoadMoreBook) {
      yield* _mapLoadNoreBookToState(event);
    } else if (event is ShowFavoriteBook) {
      yield* _mapFavoriteToState(event);
    }
  }

  Stream<BookState> _mapLoadNoreBookToState(LoadMoreBook event) async* {
    final int nextIndex = event.books.length + 1;
    yield* _getBooks(books: event.books, startIndex: nextIndex);
  }

  Stream<BookState> _getBooks({List<Book> books, int startIndex = 0}) async* {
    try {
      List<Book> newBookList =
          books + await _bookRepository.getFlutterBooks(startIndex: 1);
      yield BookLoadedState(newBookList);
    } catch (e) {
      print(e);
      yield BookErrorState();
    }
  }

  Stream<BookState> _mapAppStartedToState() async* {
    yield BookLoadingState();
    yield* _getBooks(books: []);
  }

  Stream<BookState> _mapFavoriteToState(BookEvent event) async* {
    yield BookLoadingState();
    yield* _getSavedBoks();
  }

  _getSavedBoks() async* {
    try {
      List<Book> savedBooks = await _sharedPref.getAllFavorites();
      yield BookLoadedState(savedBooks);
    } catch (e) {
      print(e);
      yield BookErrorState();
    }
  }
}
