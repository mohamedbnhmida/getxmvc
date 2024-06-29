import 'package:flutter/material.dart';  
import 'package:flutter_mvc_getx/utils/app_navigation.dart';
import 'package:flutter_mvc_getx/utils/app_routes.dart';
import 'package:flutter_mvc_getx/utils/app_strings.dart';
import 'package:flutter_mvc_getx/utils/app_theme.dart';
import 'package:get/get.dart'; 
void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
     theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.login,
      getPages:AppNavigation.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
