import 'package:KBook_IbrahimShehu/bloc/book_bloc.dart';
import 'package:KBook_IbrahimShehu/models/book.dart';
import 'package:KBook_IbrahimShehu/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Books"),
        ),
        body: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            return _buildBody(state);
          },
        ));
  }

  Widget _buildBody(BookState state) {
    if (state is BookLoadingState) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.teal,
        ),
      );
    }
    if (state is BookLoadedState) {
      return NotificationListener<ScrollNotification>(
        // onNotification: () {},
        onNotification: (notification) =>
            _onScrollNotification(notification, state),
        child: ListView.builder(
            controller: _scrollController,
            itemCount: state.books.length,
            itemBuilder: (ctx, index) {
              Book book = state.books[index];
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return BookDetailsScreen(book);
                  }));
                },
                title: Text(book.title),
              );
            }),
      );
    }
    if (state is BookErrorState) {
      return Center(
        child: Text("Error occured"),
      );
    }
    return Container();
  }

  bool _onScrollNotification(
      ScrollNotification notification, BookLoadedState state) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      context.bloc<BookBloc>().add(LoadMoreBook(state.books));
    }
    return false;
  }
}
