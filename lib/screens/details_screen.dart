import 'package:KBook_IbrahimShehu/models/book.dart';
import 'package:KBook_IbrahimShehu/utils/favourite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;
  BookDetailsScreen(this.book);
  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Favorite provider = Provider.of<Favorite>(context);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.book.imageUrl))),
              ),
              Positioned(
                  left: 10,
                  bottom: 10,
                  child: provider.isFavorite(widget.book.id)
                      ? IconButton(
                          icon: Icon(Icons.favorite_border_sharp),
                          onPressed: () {
                            provider.unFavourite(widget.book.id);
                          })
                      : IconButton(
                          icon: Icon(Icons.favorite_outline),
                          onPressed: () {
                            provider.addToFavorite(widget.book.id, widget.book);
                          }))
            ],
          ),
          ListTile(
            title: Text(widget.book.title ?? ""),
          ),
          ListTile(
            title: Text(widget.book.author ?? ""),
          ),
          ListTile(
            title: Text(widget.book.id ?? ""),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(widget.book.description ?? ""),
          ),
          widget.book.isAvailable
              ? Container(
                  width: 200,
                  height: 60,
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: RaisedButton(
                      child: Text("Buy"),
                      onPressed: () {
                        _launchBrowser(widget.book.pdfUrl);
                      }),
                )
              : Offstage()
        ],
      ),
    );
  }

  _launchBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
