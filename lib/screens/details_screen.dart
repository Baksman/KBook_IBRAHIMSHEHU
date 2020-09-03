import 'package:KBook_IbrahimShehu/models/book.dart';
import 'package:flutter/material.dart';
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
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage(widget.book.imageUrl))),
              ),
              Positioned(
                  left: 10,
                  bottom: 10,
                  child: IconButton(
                      icon: Icon(Icons.favorite_outline), onPressed: () {}))
            ],
          ),
          ListTile(
            title: Text(widget.book.title),
          ),
          ListTile(
            title: Text(widget.book.author),
          ),
          ListTile(
            title: Text(widget.book.id),
          ),
          // ListTile(
          //   title: Text("${widget.book.pdf["isAvailable"]}"),
          // ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(widget.book.description ?? ""),
          ),
          widget.book.isAvailable
              ? RaisedButton(onPressed: () {
                  _launchBrowser(widget.book.pdfUrl);
                })
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
