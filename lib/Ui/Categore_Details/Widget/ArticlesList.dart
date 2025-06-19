import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c14/Ui/Categore_Details/Widget/ArticleItem.dart';

class ArticlesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ArticleItem(),
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemCount: 10,
    );
  }
}
