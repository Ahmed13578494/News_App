import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c14/Core/remote/network/ApiManager.dart';
import 'package:news_app_c14/Model/CategoryModel.dart';

import '../Widget/ArticlesList.dart';

class CategoryDetailsWidget extends StatelessWidget {
  CategoryModel categoryModel;

  CategoryDetailsWidget(this.categoryModel);

  /*static const List<String> sources = [
    "ABC News",
    "Aftenposten",
    "ANSA.it",
    "Ary News",
    "Axios",
  ];*/

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading
          return Center(child: CircularProgressIndicator(),);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        var sources = snapshot.data?.sources ?? [];
        return Padding(
          padding: REdgeInsets.all(15),
          child: DefaultTabController(
            // عشان اقدر استخدم ويدجيت Tapbar لازم استخد الويدجيت دي
            length: sources.length,
            // وهنا بنحدد كام tapa بس دي بنجيبها من برا عشان نعرف فيه كام مصدر خبر
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                  unselectedLabelStyle: Theme
                      .of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  indicatorColor: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                  dividerHeight: 0,
                  tabs: sources
                      .map((sources) => Tab(text: sources.name))
                      .toList(),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: TabBarView(
                    children: sources.map((sources) => ArticlesList()).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
