import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c14/Model/MVVM/MVVM_Cubit/ArticlesDetailsVeiwModel.dart';
import 'package:news_app_c14/Ui/Categore_Details/Widget/ArticleItem.dart';

class ArticlesList extends StatefulWidget {
  String sourceId;

  ArticlesList({required this.sourceId});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ArticlesDetailsViewModel()
        ..getArticles(widget.sourceId),
      child: BlocBuilder<ArticlesDetailsViewModel, ArticlesDetailsState>(
        builder: (context, state) {
          var viewModel = BlocProvider.of<ArticlesDetailsViewModel>(context);
          if (state is ErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMessage, style: TextStyle(
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
                      //viewModel.getSources(widget.categoryModel.id);
                      viewModel.getArticles(widget.sourceId);
                    },
                    child: Text("Try Again")
                )
              ],
            );
          } else if (state is SuccessState) {
            return ListView.separated(
              itemBuilder: (context, index) =>
                  ArticleItem(
                      articles: state.articles[index]
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: state.articles.length,
            );
          }
          return Center(child: CircularProgressIndicator(
            color: Theme
                .of(context)
                .colorScheme
                .primary,
          ),);
        },
      ),
    );
  }
}
/*ChangeNotifierProvider(
      create: (context) =>
      EverythingViewModel()
        ..getEverything(widget.sourceId),
      child: Consumer<EverythingViewModel>(
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
                      viewModel.getEverything(widget.sourceId);
                    },
                    child: Text("Try Again")
                )
              ],
            );
          }
          var sources = viewModel.articles;
          return ListView.separated(
            itemBuilder: (context, index) =>
                ArticleItem(
                    articles: sources[index]
                ),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: sources.length,
          );
        },
      ),
    )*/
/*FutureBuilder(
        future: ApiManager.getEverything(widget.sourceId),
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
          var sources = snapshot.data?.articles ?? [];
          return ListView.separated(
            itemBuilder: (context, index) => ArticleItem(
              articles: sources[index]
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: sources.length,
          );
        },
    )*/
