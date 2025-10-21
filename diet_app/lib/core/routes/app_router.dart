import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/screens/splash_screen.dart';
import '../widgets/main_navigation.dart';

/// Application routing configuration using GoRouter.
///
/// This class provides centralized route management for the diet app.
/// Add new routes here as the app grows.
/// For navigating use: GoRouter.of(context).go('/path');
/// Or context.go('/path');
/// For navigating use: GoRouter.of(context).push('/home');????
class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static final GoRouter router = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainNavigation(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomeTab(),
          ),
          GoRoute(
            path: '/clients',
            name: 'clients',
            builder: (context, state) => const ClientsTab(),
          ),
          GoRoute(
            path: '/schedule',
            name: 'schedule',
            builder: (context, state) => const ScheduleTab(),
          ),
        ],
      ),
      // Add more routes here as needed
      // GoRoute(
      //   path: '/profile',
      //   name: 'profile',
      //   builder: (context, state) => const ProfilePage(),
      // ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}


/// Error page for invalid routes
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            SizedBox(height: 16),
            Text(
              'Page Not Found',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'The page you are looking for does not exist.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
