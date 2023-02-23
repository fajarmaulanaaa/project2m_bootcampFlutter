import 'dart:convert';

import 'package:get/get.dart';
import 'package:project_2m/app/routes/app_pages.dart';

import '../../../model/book_detail_model.dart';
import '../../../model/list_book_model.dart';
import '../../../service/book_service.dart';

class HomeController extends GetxController {
  // var databook = ListBook().obs;

  RxList<ListBook> allbook = List<ListBook>.empty(growable: true).obs;
  Rxn<DetailBook> detailBook = Rxn<DetailBook>();
  // var detailsBook = DetailBook().obs;

  final count = 0.obs;
  @override
  void onInit() {
    getBooks();
    super.onInit();
  }

  Future getBooks() async {
    try {
      var result = await BookService().fetchBookList();
      if (result.statusCode == 200) {
        allbook.assignAll(listbookFromJson(result.body));
        // final databook = json.decode(result.body);
        print(result.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Get.snackbar("eror", "eror");
    }
  }

  getDetailsBook(String id) async {
    DetailBook data = DetailBook();
    data = await BookService().bookDetails(id).then((value) => data = value);
    if (data.error == "0") {
      detailBook.value = data;
      Get.toNamed(Routes.BOOK_DETAILS);
    } else {
      throw Exception('Failed to load data');
    }
    print(data.desc);
    // print();
    // if (res.error == "0") {
    //   detailsBook.value = data;
    //   print(res);
    // }
    //   try {
    //   var result = await BookService().bookDetails(id);
    //   if (result.statusCode == 200) {
    //     detailsBook.assignAll(detailBookFromJson(result.body));
    //     // final databook = json.decode(result.body);
    //     print(result.body);
    //   } else {
    //     throw Exception('Failed to load data');
    //   }
    // } catch (e) {
    //   Get.snackbar("eror", "eror");
    // }

    // var res = await BookService().bookDetails(id);
    // // detailsBook.value = res;
    // print(res.body);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}


  // ListBook data = ListBook();
  //   var result =
  //       await BookService().fetchBookList().then((value) => data = value);
  //   if (result.error == "0") {
  //     databook.value = data;
  //   }
  //   print(data.books!.length);
  // }
