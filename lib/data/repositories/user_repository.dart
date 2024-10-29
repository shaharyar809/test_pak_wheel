import 'dart:convert';

import '../models/user_model.dart';
import '../../core/services/api_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<List<User>> fetchUsers() async {
    final response = await apiService.fetchData('users');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
