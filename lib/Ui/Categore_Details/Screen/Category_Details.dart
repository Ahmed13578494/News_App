import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c14/Model/CategoryModel.dart';
import 'package:news_app_c14/Model/MVVM/Source_view_Model.dart';
import 'package:provider/provider.dart';

import '../Widget/ArticlesList.dart';

class CategoryDetailsWidget extends StatefulWidget {
  CategoryModel categoryModel;

  CategoryDetailsWidget(this.categoryModel);

  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {
  //SourceViewModel viewModel = SourceViewModel();
  @override
  Widget build(BuildContext context) {
    //SourceViewModel viewModel = Provider.of<SourceViewModel>(context);
    return ChangeNotifierProvider(
        create: (context) =>
        SourceViewModel()
          ..getSources(widget.categoryModel.id),
        child: Consumer<SourceViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading == true) {
                return Center(child: CircularProgressIndicator(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                ),);
              } else if (viewModel.errorMessage != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(viewModel.errorMessage ?? "", style: TextStyle(
                        fontSize: 20.sp,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primary
                    ),),
                    SizedBox(height: 10.h,),
                    ElevatedButton(
                        onPressed: () {
                          /*setState(() {

                        });*/
                          //viewModel.errorMessage = null;
                          viewModel.getSources(widget.categoryModel.id);
                        },
                        child: Text("Try Again")
                    )
                  ],
                );
              }
              var sources = viewModel.sources;
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
                            ?.copyWith(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
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
                          children: sources
                              .map((sources) =>
                              ArticlesList(sourceId: sources.id ?? "",))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          /*if(viewModel.sources == null){
              return Center(child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),);
            }else{
              return Padding(
                padding: REdgeInsets.all(15),
                child: DefaultTabController(
                  // عشان اقدر استخدم ويدجيت Tapbar لازم استخد الويدجيت دي
                  length: viewModel.sources?.length??0,
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
                        tabs: viewModel.sources
                            !.map((sources) => Tab(text: sources.name))
                            .toList(),
                      ),
                      SizedBox(height: 16.h),
                      Expanded(
                        child: TabBarView(
                          children: sources.map((sources) => ArticlesList(sourceId: sources.id??"",)).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }*/

        )
      /*FutureBuilder(
        future: ApiManager.getSources(widget.categoryModel.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading
            // الشرط دا في حالة الLoading
            return Center(child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),);
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.error.toString(),style: TextStyle(
                    fontSize: 20.sp,
                    color: Theme.of(context).colorScheme.primary
                ),),
                SizedBox(height: 10.h,),
                ElevatedButton(
                    onPressed: (){
                      setState(() {

                      });
                    },
                    child: Text("Try Again")
                )
              ],
            );
          }else if(snapshot.data?.status != "ok"){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.message??"",style: TextStyle(
                    fontSize: 20.sp,
                    color: Theme.of(context).colorScheme.primary
                ),),
                SizedBox(height: 10.h,),
                ElevatedButton(
                    onPressed: (){
                      setState(() {

                      });
                    },
                    child: Text("Try Again")
                )
              ],
            );
          }
          var sources = snapshot.data?.sources ?? []; // هنا بنرجع الليستة عاشن ناخد منها حجمها
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
                      children: sources.map((sources) => ArticlesList(sourceId: sources.id??"",)).toList(),
                    ),
                  ),
                ],
              ),
            ),
          );

        },
      ),*/
    );
  }
}
/*Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) => Text(sources[index].id??"",style: TextStyle(
                color: ColorManager.blackColor,
                fontSize: 30
              ),),
            itemCount: sources.length,
          ),
        );*/
