part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookEmptyState extends BookState {}

class BookLoadingState extends BookState {}

class BookLoadedState extends BookState {
  final List<Book> books;

  BookLoadedState(this.books);

  @override
  List<Object> get props => [books];

  @override
  String toString() {
    // TODO: implement toString
    return "the books are $books";
  }
}

class BookErrorState extends BookState {}
