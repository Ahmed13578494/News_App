import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c14/Core/remote/network/ApiManager.dart';
import 'package:news_app_c14/Model/SourcesResponnse/Source.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  CategoryDetailsViewModel() : super(LoadingState());

  getSources(String category) async {
    try {
      emit(LoadingState());
      var response = await ApiManager.getSources(category);
      if (response?.status == "error") {
        // error
        emit(ErrorState(response?.message ?? ""));
      } else {
        // success
        emit(SuccessState(response?.sources ?? []));
      }
    } catch (e) {
      // error
      emit(ErrorState("Error Loading Sources List"));
    }
  }
}

abstract class CategoryDetailsState {}

class SuccessState extends CategoryDetailsState {
  List<Source> sources;

  SuccessState(this.sources);
}

class ErrorState extends CategoryDetailsState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class LoadingState extends CategoryDetailsState {}
