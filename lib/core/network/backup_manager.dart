import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

enum OperationType { create, update, delete }

class BackupOperation<T> {
  final String id;
  final OperationType type;
  final T? data;
  final DateTime timestamp;
  final Map<String, dynamic>? metadata;
  
  BackupOperation({
    required this.id,
    required this.type,
    this.data,
    required this.timestamp,
    this.metadata,
  });
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'data': data,
    'timestamp': timestamp.toIso8601String(),
    'metadata': metadata,
  };
  
  factory BackupOperation.fromJson(Map<String, dynamic> json) {
    return BackupOperation(
      id: json['id'],
      type: OperationType.values.firstWhere((e) => e.name == json['type']),
      data: json['data'],
      timestamp: DateTime.parse(json['timestamp']),
      metadata: json['metadata'],
    );
  }
}

class BackupManager {
  static const String _keyPrefix = 'backup_';
  
  Future<void> addOperation<T>(String category, BackupOperation<T> operation) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$_keyPrefix$category';
    
    final existing = await getOperations<T>(category);
    
    // Remove any existing operation with the same ID to maintain uniqueness
    existing.removeWhere((op) => op.id == operation.id);
    existing.add(operation);
    
    final jsonList = existing.map((op) => op.toJson()).toList();
    await prefs.setString(key, jsonEncode(jsonList));
  }
  
  Future<List<BackupOperation<T>>> getOperations<T>(String category) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$_keyPrefix$category';
    final jsonString = prefs.getString(key);
    
    if (jsonString == null) return [];
    
    final jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((json) => BackupOperation<T>.fromJson(json)).toList();
  }
  
  Future<void> removeOperation(String category, String operationId) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$_keyPrefix$category';
    
    final existing = await getOperations(category);
    existing.removeWhere((op) => op.id == operationId);
    
    final jsonList = existing.map((op) => op.toJson()).toList();
    await prefs.setString(key, jsonEncode(jsonList));
  }
  
  Future<void> clearOperations(String category) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$_keyPrefix$category';
    await prefs.remove(key);
  }
}
