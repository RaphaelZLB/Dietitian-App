import 'package:diet_app/core/routes/app_router.dart';
import 'package:diet_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MaterialTheme theme = MaterialTheme(Theme.of(context).textTheme);
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'EatSmart',
      theme: theme.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}