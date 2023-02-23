import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../model/list_book_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  @override
  var controller = Get.find<HomeController>();
  List<ListBook>? listbook = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Book List'),
          centerTitle: true,
        ),
        body: Obx((() => ListView.builder(
              itemCount: controller.allbook.length,
              itemBuilder: (context, index) {
                var data = controller.allbook[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      child: Card(
                          elevation: 1.5,
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: GestureDetector(
                              onTap: () {
                                // Get.snackbar("Halo", "Halo");
                                controller.getDetailsBook(data.isbn13);
                                // Get.toNamed(Routes.BOOK_DETAILS);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    "${data.image}",
                                    height: 200,
                                    width: 200,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${data.title}",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              textBaseline:
                                                  TextBaseline.ideographic),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "${data.subtitle}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              textBaseline:
                                                  TextBaseline.ideographic),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "ISBN : ${data.isbn13}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              textBaseline:
                                                  TextBaseline.ideographic),
                                        ),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {},
                                                child: Text("Buy")),
                                            SizedBox(width: 5),
                                            Text(
                                              "${data.price}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  textBaseline:
                                                      TextBaseline.ideographic),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))),
                );
              },
            ))));
  }
}
