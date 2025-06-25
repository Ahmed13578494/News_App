import 'package:flutter/material.dart';
import 'package:news_app_c14/Core/remote/network/ApiManager.dart';

import '../EverythingResponse/Articles.dart';

class EverythingViewModel extends ChangeNotifier {
  List<Articles> articles = [];
  String? errorMessage;
  bool isLoading = false;

  void getEverything(String sources) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();
      var response = await ApiManager.getEverything(sources);
      isLoading = false;
      if (response?.status == "error") {
        errorMessage = response!.message;
      } else {
        articles = response?.articles ?? [];
      }
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = "Error Loading Sources List";
      notifyListeners();
    }
  }
}
