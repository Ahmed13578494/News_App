import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c14/Core/remote/network/constants.dart';
import 'package:news_app_c14/Model/SourcesResponnse/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse?> getSources(String category) async {
    try {
      Uri uri = Uri.https(domain, "v2/top-headlines/sources", {
        "apiKey": apiKey,
        "category": category,
      });

      var response = await http.get(uri);
      //print(response.body);
      // print(response.statusCode);
      var json = jsonDecode(response.body); // تم تحويل الString الي json
      //print(json["sources"]);
      var sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
