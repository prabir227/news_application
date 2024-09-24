import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/controllers/newsscreen_controller.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  final NewsScreenController newsController = Get.put(NewsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return Container(
          height: double.infinity,
          child: Column(
            children: [

              Flexible(
                flex: 6,
                child: (newsController.url?.isNotEmpty ?? false)
                    ? Image.network(
                  newsController.url!.value,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text("Image failed to load"),
                    ),
                  ),
                )
                    : Container(
                  color: Colors.grey,
                  child: Center(
                    child: Text("No Image Available"),
                  ),
                ),
              ),

              Flexible(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // News Title
                        Text(
                          newsController.title.value ?? "No Title",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),

                          overflow: TextOverflow.visible,
                        ),
                        SizedBox(height: 10),
                        // News Description
                        Text(
                          newsController.description.value ?? "No Description",
                          style: TextStyle(fontSize: 16),

                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                        SizedBox(height: 20,),
                        Text(
                          newsController.content.value,
                          style: TextStyle(fontSize: 16),

                          overflow: TextOverflow.visible,
                          softWrap: true,

                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
