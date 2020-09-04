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
        pdfUrl: (json["accessInfo"] as Map)["pdf"]["acsTokenLink"],
        description: (json["volumeInfo"]["description"]) as String,
        imageUrl:
            (json["volumeInfo"]["imageLinks"] as Map)["thumbnail"] as String,
        author: json["volumeInfo"]["authors"][0],
        id: json["id"],
        isAvailable: (json["accessInfo"]["pdf"] as Map)["isAvailable"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "pdfUrl": pdfUrl,
      "isAvalaible": isAvailable,
      "id": id,
      "author": author,
      "description": description,
      "imageUrl": imageUrl
    };
  }

  factory Book.fromStorage(Map<String, dynamic> map) {
    return Book(
      author: map["author"],
      description: map["description"],
      id: map["id"],
      imageUrl: map["imageUrl"],
      isAvailable: map["isAvailable"],
      pdfUrl: map["pdfUrl"],
      title: map["title"],
    );
  }

  @override
  String toString() {
    return "$title $author $description $id $isAvailable";
  }
}

// https://www.googleapis.com/books/v1/volumes?q=Flutter&maxResults=20&key=AIzaSyAPM-7Q50lA77YguZsqFp6Ikyu1DqmIz_Y title
