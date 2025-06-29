import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c14/Core/resources/AppTheme.dart';
import 'package:news_app_c14/Core/resources/RoutesManager.dart';
import 'package:news_app_c14/Ui/Home/Screen/Home_Screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // طالما الmain فيها asyanc يبقا لازم نستخدم السطر دا
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
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
        return EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations',
          fallbackLocale: Locale('en'),
          child: const MyMaterialApp(),
        );
      },
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // آمنة هنا بعد EasyLocalization
      title: 'News App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {RoutesManager.home: (_) => HomeScreen()},
      initialRoute: RoutesManager.home,
    );
  }
}
