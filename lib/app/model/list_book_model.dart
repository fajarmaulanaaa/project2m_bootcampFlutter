// To parse this JSON data, do
//
//     final listBook = listBookFromJson(jsonString);

import 'dart:convert';

class ListBook {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  ListBook(
      {required this.title,
      required this.subtitle,
      required this.isbn13,
      required this.price,
      required this.image,
      required this.url});
  factory ListBook.listbookFromJson(Map<String, dynamic> data) => ListBook(
      title: data['title'],
      subtitle: data['subtitle'],
      isbn13: data['isbn13'],
      price: data['price'],
      image: data['image'],
      url: data['url']);
}

List<ListBook> listbookFromJson(String val) => List<ListBook>.from(
    json.decode(val)['books'].map((val) => ListBook.listbookFromJson(val)));


// ListBook listBookFromJson(String str) => ListBook.fromJson(json.decode(str));

// String listBookToJson(ListBook data) => json.encode(data.toJson());

// class ListBook {
//   ListBook({
//     this.error,
//     this.total,
//     this.books,
//   });

//   String? error;
//   String? total;
//   List<Book>? books;

//   factory ListBook.fromJson(Map<String, dynamic> json) => ListBook(
//         error: json["error"],
//         total: json["total"],
//         books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "error": error,
//         "total": total,
//         "books": List<dynamic>.from(books!.map((x) => x.toJson())),
//       };
// }

// class Book {
//   Book({
//     this.title,
//     this.subtitle,
//     this.isbn13,
//     this.price,
//     this.image,
//     this.url,
//   });

//   String? title;
//   String? subtitle;
//   String? isbn13;
//   String? price;
//   String? image;
//   String? url;

//   factory Book.fromJson(Map<String, dynamic> json) => Book(
//         title: json["title"],
//         subtitle: json["subtitle"],
//         isbn13: json["isbn13"],
//         price: json["price"],
//         image: json["image"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "subtitle": subtitle,
//         "isbn13": isbn13,
//         "price": price,
//         "image": image,
//         "url": url,
//       };
// }
