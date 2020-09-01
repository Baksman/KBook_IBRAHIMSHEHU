import 'dart:async';

import 'package:KBook_IbrahimShehu/models/book.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookEmptyState());

  @override
  Stream<BookState> mapEventToState(
    BookEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
