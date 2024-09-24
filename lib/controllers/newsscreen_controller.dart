import 'package:get/get.dart';
import 'package:news_application/view/news_screen.dart';

class NewsScreenController extends GetxController{
  RxString  ?url = "".obs;
  RxString title = "".obs;
  RxString description = "".obs;
  RxString content = "".obs;
  void viewNews(String url,String title, String description ,String content){
    this.url?.value = url;
    this.title.value=title;
    this.description.value=description;
    this.content.value=content;
    Get.to(NewsScreen());

  }

}