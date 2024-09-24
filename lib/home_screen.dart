import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_application/controllers/homescreen_controller.dart';
import 'package:news_application/controllers/newsscreen_controller.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeScreenState();

}
class HomeScreenState extends State<HomeScreen>{
  final HomescreenController controller = Get.put(HomescreenController());
  final NewsScreenController newsScreenController = Get.put(NewsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Articles'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.articles.isEmpty) {
          return Center(child: Text('No articles found'));
        } else {
          return ListView.builder(
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final article = controller.articles[index];
              return InkWell(
                onTap: (){
                    newsScreenController.viewNews(article.urlToImage!, article.title, article.description,article.content);
                },
                child: Card(
                  child: Container(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            child: article.urlToImage !=null ? Image.network(article.urlToImage!,fit: BoxFit.cover,): Text("Image not available"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: 180,
                              child: Text(article.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }

}