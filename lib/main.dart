import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_application/services/theme_services.dart';
import 'package:todo_application/ui/theme.dart';
import 'ui/pages/home_page.dart';

void main() {
 // WidgetsFlutterBinding.ensureInitialized;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dart,
      themeMode: ThemeServices().theme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
