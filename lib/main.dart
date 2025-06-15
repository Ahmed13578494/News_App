import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c14/Core/resources/AppTheme.dart';
import 'package:news_app_c14/Core/resources/RoutesManager.dart';
import 'package:news_app_c14/Ui/Home/Screen/Home_Screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // طالما الmain فيها asyanc يبقا لازم نستخدم السطر دا
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true, // حجم الFonts
      splitScreenMode: true, //
      builder: (context , child){
        return MaterialApp(
          title: 'News App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,

          routes: {
            RoutesManager.home : (_)=> HomeScreen(),
          },
          initialRoute: RoutesManager.home,
        );
      },
    );
  }
}
