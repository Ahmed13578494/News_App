import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app_c14/Core/resources/AssetManager.dart';
import 'package:news_app_c14/Core/resources/StringManager.dart';
import 'package:news_app_c14/Ui/Home/Widget/CategoryIten.dart';
import 'package:news_app_c14/Ui/Home/Widget/CustomDrawer.dart';

import '../../../Model/CategoryModel.dart';

class HomeScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(StringManager.home),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AssetManager.search,
                height: 24.h,
                width: 24.w,
                colorFilter: ColorFilter.mode(
                    Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    BlendMode.srcIn
                ),
              )
          )
        ],
      ),
      body: Padding(
        padding: REdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringManager.welcomeMessage,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
            SizedBox(height: 16.h,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      CategoryIten(index: index,
                        categoryModel: CategoryModel.categories[index],),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                  itemCount: CategoryModel.categories.length
              ),
            )
          ],
        ),
      ),
    );
  }

}