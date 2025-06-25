import 'package:news_app_c14/Core/resources/AssetManager.dart';
import 'package:news_app_c14/Core/resources/StringManager.dart';

class CategoryModel {
  final String title;
  final String image;
  final String id;

  const CategoryModel({
    required this.title,
    required this.image,
    required this.id,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      title: StringManager.general,
      image: AssetManager.general,
      id: 'general',
    ),
    CategoryModel(
      title: StringManager.business,
      image: AssetManager.business,
      id: 'business',
    ),
    CategoryModel(
      title: StringManager.entertainment,
      image: AssetManager.entertainment,
      id: 'entertainment',
    ),
    CategoryModel(
      title: StringManager.health,
      image: AssetManager.health,
      id: 'health',
    ),
    CategoryModel(
      title: StringManager.sceince,
      image: AssetManager.sceince,
      id: 'science',
    ),
    CategoryModel(
      title: StringManager.sport,
      image: AssetManager.sport,
      id: 'sports',
    ),
    CategoryModel(
      title: StringManager.technology,
      image: AssetManager.technology,
      id: 'technology',
    ),
  ];
}
