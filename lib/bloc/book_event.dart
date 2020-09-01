part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends BookEvent {}

class FavouriteBook extends BookEvent {
  final Book book;

  FavouriteBook(this.book);

}


class ShowFavoriteBook extends BookEvent{
  final List<Book> books;

  ShowFavoriteBook(this.books);

}

class LoadMoreBook extends BookEvent {
  final List<Book> books;

  LoadMoreBook(this.books);

}

