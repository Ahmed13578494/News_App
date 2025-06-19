import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app_c14/Core/resources/AssetManager.dart';
import 'package:news_app_c14/Core/resources/StringManager.dart';
import 'package:news_app_c14/Ui/Categore_Details/Screen/Category_Details.dart';
import 'package:news_app_c14/Ui/Home/Widget/CustomDrawer.dart';
import 'package:news_app_c14/Ui/Home/Widget/HomeWidget.dart';

import '../../../Model/CategoryModel.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(onClick: showHomeWidget,),
      appBar: AppBar(
        title: Text(
            categoryModel != null
                ? categoryModel!.title
                : StringManager.home
        ),
        actions: [
          IconButton(
              onPressed: () {

              },
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
      body: categoryModel != null
          ? CategoryDetailsWidget()
          : HomeWidget(onCategoryClick: showCategoryDetails,),
    );
  }

  showCategoryDetails(CategoryModel selectedCategory) {
    setState(() {
      categoryModel = selectedCategory;
    });
  }

  showHomeWidget() {
    setState(() {
      categoryModel = null;
      Navigator.pop(context);
    });
  }
}
