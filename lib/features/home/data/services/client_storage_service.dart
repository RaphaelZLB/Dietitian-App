import 'package:diet_app/features/home/data/models/client_model.dart';

/// Service for storing and retrieving client data
/// Currently uses in-memory storage. Can be replaced with shared_preferences or sqflite
class ClientStorageService {
  static final ClientStorageService _instance = ClientStorageService._internal();
  factory ClientStorageService() => _instance;
  ClientStorageService._internal();

  // In-memory storage - in production, replace with shared_preferences or sqflite
  final List<ClientModel> _clients = [];

  /// Get all clients
  List<ClientModel> getAllClients() {
    return List.unmodifiable(_clients);
  }

  /// Get client by ID
  ClientModel? getClientById(String id) {
    try {
      return _clients.firstWhere((client) => client.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Save a new client
  Future<bool> saveClient(ClientModel client) async {
    try {
      // Check if client with same email already exists
      final existingIndex = _clients.indexWhere((c) => c.email == client.email);
      
      if (existingIndex != -1) {
        // Update existing client
        _clients[existingIndex] = client;
      } else {
        // Add new client
        _clients.add(client);
      }
      
      // In production, save to shared_preferences or sqflite here
      // Example with shared_preferences:
      // final prefs = await SharedPreferences.getInstance();
      // final clientsJson = _clients.map((c) => jsonEncode(c.toJson())).toList();
      // await prefs.setStringList('clients', clientsJson);
      
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Delete a client
  Future<bool> deleteClient(String id) async {
    try {
      _clients.removeWhere((client) => client.id == id);
      
      // In production, update shared_preferences or sqflite here
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Search clients by name or email
  List<ClientModel> searchClients(String query) {
    final lowerQuery = query.toLowerCase();
    return _clients.where((client) {
      return client.name.toLowerCase().contains(lowerQuery) ||
          client.email.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  /// Load clients from storage (for shared_preferences implementation)
  Future<void> loadClients() async {
    // In production, load from shared_preferences or sqflite
    // Example:
    // final prefs = await SharedPreferences.getInstance();
    // final clientsJson = prefs.getStringList('clients') ?? [];
    // _clients = clientsJson
    //     .map((json) => ClientModel.fromJson(jsonDecode(json)))
    //     .toList();
  }
}

