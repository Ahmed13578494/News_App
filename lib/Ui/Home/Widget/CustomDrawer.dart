import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app_c14/Core/resources/AssetManager.dart';
import 'package:news_app_c14/Core/resources/ColorManager.dart';
import 'package:news_app_c14/Core/resources/StringManager.dart';

class CustomDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 166.h,
            alignment: Alignment.center,
            color: ColorManager.whiteColor,
            child: Text(StringManager.news_App,style: TextStyle(
              color: ColorManager.blackColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700
            ),),
          ),
          Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    // Navigator HomeDetalis
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(AssetManager.home,
                        height: 24.h,
                        width: 24.w,
                        colorFilter: ColorFilter.mode(
                            ColorManager.whiteColor,
                            BlendMode.srcIn
                        ),
                      ),
                      SizedBox(width: 8.w,),
                      Text(StringManager.gth,style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.whiteColor
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 24.h,),
                Divider(
                  color: ColorManager.whiteColor,
                  thickness: 2,
                ),
                SizedBox(height: 24.h,),
                Row(
                  children: [
                    SvgPicture.asset(AssetManager.theme,
                      height: 24.h,
                      width: 24.w,
                      colorFilter: ColorFilter.mode(
                          ColorManager.whiteColor,
                          BlendMode.srcIn
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Text(StringManager.theme,style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.whiteColor
                    ),)
                  ],
                ),
                SizedBox(height: 10.h,),
                DropdownButtonFormField<String>(
                  value: "Light",
                  iconEnabledColor: ColorManager.whiteColor,
                  iconDisabledColor: ColorManager.whiteColor,
                  iconSize: 30.sp,
                  dropdownColor: ColorManager.blackColor,
                  padding: REdgeInsets.only(left: 16),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: ColorManager.whiteColor
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                            color: ColorManager.whiteColor
                        )
                    ),
                  ),
                    items: [
                      DropdownMenuItem<String>(
                        value: "Light",
                          child: Text(StringManager.light,style: TextStyle(
                            color: ColorManager.whiteColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500
                          ),)
                      ),
                      DropdownMenuItem<String>(
                        value: "Dark",
                          child: Text(StringManager.dark,style: TextStyle(
                              color: ColorManager.whiteColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500
                          ),)
                      )
                    ],
                    onChanged: (value){
                    if(value == "Light"){
                      // Set Light
                    }else{
                      // Set Dark
                    }
                    }
                ),
                SizedBox(height: 24.h,),
                Divider(
                  color: ColorManager.whiteColor,
                  thickness: 2,
                ),
                SizedBox(height: 24.h,),
                Row(
                  children: [
                    SvgPicture.asset(AssetManager.language,
                      height: 24.h,
                      width: 24.w,
                      colorFilter: ColorFilter.mode(
                          ColorManager.whiteColor,
                          BlendMode.srcIn
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Text(StringManager.language,style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManager.whiteColor
                    ),)
                  ],
                ),
                SizedBox(height: 10.h,),
                DropdownButtonFormField<String>(
                    value: "English",
                    iconEnabledColor: ColorManager.whiteColor,
                    iconDisabledColor: ColorManager.whiteColor,
                    iconSize: 30.sp,
                    dropdownColor: ColorManager.blackColor,
                    padding: REdgeInsets.only(left: 16),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: ColorManager.whiteColor
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(
                              color: ColorManager.whiteColor
                          )
                      ),
                    ),
                    items: [
                      DropdownMenuItem<String>(
                          value: "English",
                          child: Text(StringManager.english,style: TextStyle(
                              color: ColorManager.whiteColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500
                          ),)
                      ),
                      DropdownMenuItem<String>(
                          value: "Arabic",
                          child: Text(StringManager.arabic,style: TextStyle(
                              color: ColorManager.whiteColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500
                          ),)
                      )
                    ],
                    onChanged: (value){
                      if(value == "English"){
                        // Set English
                      }else{
                        // Set Arabic
                      }
                    }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}