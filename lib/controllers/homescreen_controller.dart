import 'dart:convert';

import 'package:get/get.dart';
import 'package:news_application/models/article_model.dart';
import 'package:http/http.dart' as http;

class HomescreenController extends GetxController{
  var articles = <Article>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=apple&from=2024-09-22&to=2024-09-22&sortBy=popularity&apiKey=b6c9c54fb87647dfa6cb3909c6713fb8')); // Replace with your API URL

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<Article> fetchedArticles = (data['articles'] as List).map((article) => Article.fromJson(article)).toList();
        articles.assignAll(fetchedArticles);
      } else {
        Get.snackbar('Error', 'Failed to fetch data');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

}