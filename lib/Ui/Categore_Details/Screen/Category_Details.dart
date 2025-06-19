import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widget/ArticlesList.dart';

class CategoryDetailsWidget extends StatelessWidget {
  static const List<String> sources = [
    "ABC News",
    "Aftenposten",
    "ANSA.it",
    "Ary News",
    "Axios",
  ];

  @override
  Widget build(BuildContext context) {
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
              labelStyle: Theme.of(context).textTheme.titleSmall,
              unselectedLabelStyle: Theme.of(context).textTheme.titleSmall
                  ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
              indicatorColor: Theme.of(context).colorScheme.primary,
              dividerHeight: 0,
              tabs: sources.map((sources) => Tab(text: sources)).toList(),
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
  }
}
