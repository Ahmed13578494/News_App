import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/resources/StringManager.dart';
import '../../../Model/CategoryModel.dart';
import 'CategoryItem.dart';
class HomeWidget extends StatelessWidget{
  void Function(CategoryModel categoryModel) onCategoryClick;
  HomeWidget({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(StringManager.welcomeMessage.tr(),
            style: Theme
                .of(context)
                .textTheme
                .titleLarge,
          ),
          SizedBox(height: 16.h,),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    CategoryItem(index: index,
                      onPress: (){
                        onCategoryClick(CategoryModel.categories[index]);
                      },
                      categoryModel: CategoryModel.categories[index],),
                separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                itemCount: CategoryModel.categories.length
            ),
          )
        ],
      ),
    );
  }
  
}