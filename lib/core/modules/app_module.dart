import 'dart:io';
import 'package:dio/dio.dart';
import '../app_utils/api_constants.dart';
import 'package:injectable/injectable.dart';
/// App Module for dependency injection configuration
/// Provides app-wide HTTP client setup
@module
abstract class AppModule {
  
  @lazySingleton
  Dio dio() => Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
          headers: {
            HttpHeaders.userAgentHeader: 'dio',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
}
