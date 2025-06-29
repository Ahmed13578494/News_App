import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app_c14/Core/resources/AssetManager.dart';
import 'package:news_app_c14/Core/resources/ColorManager.dart';
import 'package:news_app_c14/Core/resources/StringManager.dart';
import 'package:news_app_c14/Model/CategoryModel.dart';
import 'dart:ui' as ui;
class CategoryItem extends StatelessWidget{
  int index;
  CategoryModel categoryModel;
  void Function() onPress;
  CategoryItem({required this.index , required this.categoryModel , required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 198.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        textDirection: index.isOdd?ui.TextDirection.rtl:ui.TextDirection.ltr,
        children: [
          Expanded(
            child: Image.asset(categoryModel.image,
              height: 198.h,
              //width: 170.w,
              fit: BoxFit.cover,
              matchTextDirection: true,
            ),
          ),
          //SizedBox(width: 10.w,),
          Padding(
            padding:  REdgeInsetsDirectional.only(
              top: 24,bottom: 22,start: 16,end: 16
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(categoryModel.title.tr(),style: Theme.of(context).textTheme.bodyMedium,),
                Directionality(
                  textDirection: index.isOdd?ui.TextDirection.ltr:ui.TextDirection.rtl,
                  child: ElevatedButton(
                      onPressed: onPress,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.whiteColor.withOpacity(0.5),
                        padding: REdgeInsetsDirectional.only(end: 16)
                      ),
                      child: Row(
                        textDirection: index.isOdd?ui.TextDirection.rtl:ui.TextDirection.ltr,
                        children: [
                          Text(StringManager.view,
                              style:Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(width: 10.w,),
                          CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.onPrimary,
                            radius: 30,
                            child: SvgPicture.asset(AssetManager.arrow,
                              height: 24.h,
                              width: 24.w,
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.primary,
                                  BlendMode.srcIn
                              ),
                              matchTextDirection: true,
                            ),
                          )
                        ],
                      )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}