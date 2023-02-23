import 'package:get/get.dart';

import 'package:project_2m/app/modules/home/bindings/home_binding.dart';
import 'package:project_2m/app/modules/home/views/home_view.dart';

import '../modules/bookDetails/views/book_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_DETAILS,
      page: () => BookDetailsView(),
      binding: HomeBinding(),
    ),
  ];
}
