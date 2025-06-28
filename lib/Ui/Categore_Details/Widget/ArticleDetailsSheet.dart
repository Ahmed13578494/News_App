import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c14/Core/resources/StringManager.dart';
import 'package:news_app_c14/Model/EverythingResponse/Articles.dart';

class ArticleDetailsSheet extends StatefulWidget {
  Article articles;

  ArticleDetailsSheet({required this.articles});

  @override
  State<ArticleDetailsSheet> createState() => _ArticleDetailsSheetState();
}

class _ArticleDetailsSheetState extends State<ArticleDetailsSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: widget.articles.urlToImage ?? "",
                height: 220.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onPrimary,
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
              widget.articles.content ?? "",
              //maxLines: 2,
              //overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 8.h),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //articles.url??"";
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  padding: REdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  StringManager.vfa,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
