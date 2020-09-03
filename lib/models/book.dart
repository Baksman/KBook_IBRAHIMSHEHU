class Book {
  final String title;
  final String description;
  final String author;
  final String imageUrl;
  final String id;
  final bool isAvailable;
  final String pdfUrl;

  Book(
      {this.title,
      this.imageUrl,
      this.pdfUrl,
      this.description,
      this.author,
      this.isAvailable,
      this.id});

  factory Book.fromJson(Map<String, dynamic> json) {
    //  final Map<String,String> images =
    return Book(
        title: json["volumeInfo"]["title"],
        pdfUrl: (json["accessInfo"]["pdf"] as Map)["acsTokenLink"],
        description: json["volumeInfo"]["description"] as String,
        imageUrl: (json["volumeInfo"]["imageLinks"] as Map)["thumbnail"],
        author: (json["volumeInfo"] as Map)["authors"][0] ,
        id: json["id"],
        isAvailable: (json["accessInfo"]["pdf"] as Map)["isAvailable"]);
  }

  @override
  String toString() {
    return "$title $author $description $id $isAvailable";
  }
}

// https://www.googleapis.com/books/v1/volumes?q=Flutter&maxResults=20&key=AIzaSyAPM-7Q50lA77YguZsqFp6Ikyu1DqmIz_Y title
