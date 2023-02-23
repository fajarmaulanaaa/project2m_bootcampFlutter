import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_2m/app/modules/home/controllers/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/book_details_controller.dart';

class BookDetailsView extends GetView<HomeController> {
  @override
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BookDetailsView'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ProductCarouselSlider(
              //   images: productController.detailProduct[0],
              // ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "${controller.detailBook.value!.title}",
                  style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "${controller.detailBook.value!.image}",
                    height: 200,
                    width: 200,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.detailBook.value!.subtitle}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.ideographic),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "ISBN : ${controller.detailBook.value!.isbn13}",
                          style: TextStyle(
                              fontSize: 15,
                              textBaseline: TextBaseline.ideographic),
                        ),
                        Text(
                          "Authors : ${controller.detailBook.value!.authors}",
                          style: TextStyle(
                              fontSize: 15,
                              textBaseline: TextBaseline.ideographic),
                        ),
                        Text(
                          "Language : ${controller.detailBook.value!.language}",
                          style: TextStyle(
                              fontSize: 15,
                              textBaseline: TextBaseline.ideographic),
                        ),
                        Text(
                          "Pages : ${controller.detailBook.value!.pages}",
                          style: TextStyle(
                              fontSize: 15,
                              textBaseline: TextBaseline.ideographic),
                        ),
                        Text(
                          "Years : ${controller.detailBook.value!.year}",
                          style: TextStyle(
                              fontSize: 15,
                              textBaseline: TextBaseline.ideographic),
                        ),
                        Text(
                          "Rating : ${controller.detailBook.value!.rating}",
                          style: TextStyle(
                              fontSize: 15,
                              textBaseline: TextBaseline.ideographic),
                        ),
                        Text(
                          "${controller.detailBook.value!.price}",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.ideographic),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About this book:',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${controller.detailBook.value!.desc}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          textBaseline: TextBaseline.ideographic),
                      maxLines: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
              onPressed: () async {
                await openUrl("${controller.detailBook.value!.url}");
              },
              child: Text("Buy")),
        )

        // Center(
        //   child: Text(
        //     '${controller.detailBook.value!.desc}',
        //     style: TextStyle(fontSize: 20),
        //   ),
        // ),
        );
  }
}

Future<void> openUrl(String url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  await launch(url,
      forceWebView: forceWebView, enableJavaScript: enableJavaScript);
}
