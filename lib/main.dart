import 'package:KBook_IbrahimShehu/bloc/book_bloc.dart';
// import 'package:KBook_IbrahimShehu/repository/book_repository.dart';
import 'package:KBook_IbrahimShehu/screens/home_screen.dart';
import 'package:KBook_IbrahimShehu/utils/drop_down_utils.dart';
import 'package:KBook_IbrahimShehu/utils/favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookBloc>(
      create: (context) => BookBloc()..add(AppStarted()),
      child: MultiProvider(
        providers: [
          ListenableProvider(create: (_) => Favorite()),
          ListenableProvider(create: (_) => DropdownUtils()),
          
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: HomeScreen(),
        ),
      ),
    );
  }
}

// ListenableProvider
