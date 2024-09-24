import 'dart:convert';
import 'package:news_application/data/network/base_api_services.dart';
import 'package:http/http.dart' as http ;
import 'package:get/get.dart';

class NetworkApiServices extends BaseApiServices{
  dynamic responseJson;

  @override
  Future<dynamic> getApi(String url) async{
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);

    }
    catch(e){
      Get.snackbar("Network error", "unable to fetch data");
    }

  }
  dynamic returnResponse(http.Response response){
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }
    else {
      throw Exception();
    }
  }

}