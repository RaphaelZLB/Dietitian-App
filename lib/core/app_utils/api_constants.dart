/// API Configuration Constants
/// 
/// For local Express server:
/// - Android Emulator: Use '10.0.2.2' instead of 'localhost'
/// - iOS Simulator: Can use 'localhost' or '127.0.0.1'
/// - Physical Device: Use your PC's local IP (e.g., '192.168.1.100')
class ApiConstants {
  // Development Base URL configuration
  // Change this to match your Express server port
  //static const String baseUrl = 'http://10.0.2.2:8000/api'; // For Android Emulator
  static const String baseUrl = 'http://localhost:8000/api'; // For iOS Simulator/Web
  // static const String baseUrl = 'http://192.168.1.100:8000/api'; // For Physical Device (replace with your PC's IP)

  // API Endpoints
  static const String clients = '/clients';
  static const String clientById = '/clients/{id}'; // Use with /{id}
  
  // Request timeout durations
  static const Duration connectTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);
  static const Duration sendTimeout = Duration(seconds: 60);
}
