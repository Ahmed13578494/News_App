import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c14/Core/remote/network/ApiManager.dart';
import 'package:news_app_c14/Model/EverythingResponse/Articles.dart';

class ArticlesDetailsViewModel extends Cubit<ArticlesDetailsState> {
  ArticlesDetailsViewModel() : super(LoadingState());

  getArticles(String sources) async {
    try {
      emit(LoadingState());
      var response = await ApiManager.getEverything(sources);
      if (response?.status == "error") {
        // error
        emit(ErrorState(response?.message ?? ""));
      } else {
        emit(SuccessState(response?.articles ?? []));
      }
    } catch (e) {
      emit(ErrorState("Error Loading Sources List"));
    }
  }
}

abstract class ArticlesDetailsState {}

class SuccessState extends ArticlesDetailsState {
  List<Article> articles;

  SuccessState(this.articles);
}

class ErrorState extends ArticlesDetailsState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class LoadingState extends ArticlesDetailsState {}
