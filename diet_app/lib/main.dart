import 'package:diet_app/core/app/app_theme.dart';
import 'package:diet_app/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  final MaterialTheme theme = MaterialTheme(Theme.of(context).textTheme);
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: false,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          title: 'EatSmart',
          theme: theme.light(),
          darkTheme: theme.dark(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
    }
  }