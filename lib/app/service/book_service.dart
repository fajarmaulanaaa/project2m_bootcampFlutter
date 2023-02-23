import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_2m/app/model/list_book_model.dart';
import 'package:project_2m/app/modules/home/controllers/home_controller.dart';

import '../model/book_detail_model.dart';

class BookService {
  var client = http.Client();
  var remoteUrl = 'https://api.itbook.store';

  Future<dynamic> fetchBookList() async {
    var response = await client.get(
      Uri.parse('$remoteUrl/1.0/new'),
      headers: {
        "Content-Type": "application/json",
      },
    );
    return response;
  }

  Future<DetailBook> bookDetails(String id) async {
    var response = await client.get(
      Uri.parse('$remoteUrl/1.0/books/$id'),
      headers: {
        "Content-Type": "application/json",
      },
    );
    return DetailBook.fromJson(jsonDecode(response.body));
    // return response;
  }
}
