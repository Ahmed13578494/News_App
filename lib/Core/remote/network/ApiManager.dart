import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c14/Core/remote/network/constants.dart';
import 'package:news_app_c14/Model/EverythingResponse/EverythingResponse.dart';
import 'package:news_app_c14/Model/SourcesResponnse/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse?> getSources(String category) async {
    // https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    try {
      Uri url = Uri.https(
          domain, // اسم السيرفير
          "v2/top-headlines/sources", // اسم الApi
          {
            "apiKey": apiKey,
            // هنا بنبعت الApiKey عشان الديكمونتيشن معموله Required
            "category": category,
            // وهنا بنبعت اسم المصدر بId عشان يجبلنا اسامي المصادر بId معين
      });
      //var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY"));
      var response = await http.get(url);
      //print(response.body);
      // print(response.statusCode);
      var json = jsonDecode(response.body); // تم تحويل الString الي json
      //print(json["sources"]);
      var sourcesResponse = SourcesResponse.fromJson(json);

      //SourcesResponse.fromJson(jsonDecode(response.body));
      return sourcesResponse;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<EverythingResponse?> getEverything(String sources) async {
    try {
      Uri url = Uri.https(
          domain,
          "v2/everything",
          {
            "apiKey": apiKey,
            "sources": sources,
          }

      );

      var response = await http.get(url);

      EverythingResponse everyResponse = EverythingResponse.fromJson(
          jsonDecode(response.body));
      return everyResponse;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
