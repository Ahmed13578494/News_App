import 'package:flutter/cupertino.dart';
import 'package:news_app_c14/Core/remote/network/ApiManager.dart';
import 'package:news_app_c14/Model/SourcesResponnse/Source.dart';

class SourceViewModel extends ChangeNotifier {
  List<Source> sources = [];
  String? errorMessage;
  bool isLoading = false;

  void getSources(String categoryId) async {
    try {
      errorMessage = null;
      sources = [];
      isLoading = true;
      notifyListeners();
      var response = await ApiManager.getSources(categoryId);
      isLoading = false;
      //notifyListeners();
      if (response?.status == "error") {
        errorMessage = response!.message;
        //notifyListeners();
      } else {
        sources = response?.sources ?? [];
        //notifyListeners();
      }
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = "Error Loading Sources List";
      notifyListeners();
    }
  }
}
