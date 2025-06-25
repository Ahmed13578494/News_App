import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c14/Ui/Categore_Details/Widget/ArticleDetailsSheet.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../Model/EverythingResponse/Articles.dart';

class ArticleItem extends StatelessWidget {
  Articles articles;

  ArticleItem({required this.articles});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,

          backgroundColor: Theme.of(context).colorScheme.primary,
          builder: (context) =>
              ArticleDetailsSheet(
                articles: articles,
              ),
        );
      },
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? "",
                height: 220.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Center(
                      child: Icon(Icons.error, color: Colors.red, size: 24.sp),
                    ),
              ),
              /* Image.network("https://miro.medium.com/v2/resize:fit:1200/1*u70S_HwUu2v4tGn5V0K_7A.png",
              // عملنا دي من نوع Network عشان دي هتجي من علي سيرفير من الانترنت
                height: 220.h,
                //width: 345.w,
                fit: BoxFit.cover,
              ),*/
            ),
            SizedBox(height: 10.h),
            Text(
              articles.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Text("By : ${articles.author}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
                  ),
                ),

                Expanded(
                  child: Text(
                    timeago.format(
                        DateTime.parse(articles.publishedAt ?? "")),

                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
