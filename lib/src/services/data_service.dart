import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';
import '../models/user.dart';

class DataService {
  static Future<List<User>> getUsers() async {
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/users'); // Replace with your API endpoint

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);

        return jsonList.map((json) => User.fromJson(json)).toList();
      } else {
        // Handle error: API request failed
        debugPrint('Error: ${response.statusCode}');
        throw Exception(
            'Failed to load users'); // Or return an empty list: return [];
      }
    } catch (e) {
      // Handle error: Network or other exceptions
      debugPrint('Error: $e');
      throw Exception(
          'Failed to load users'); // Or return an empty list: return [];
    }
  }
  
  static Future<List<Post>> getPosts(int userId) async {
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?userId=$userId'); // Replace with your API endpoint

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);

        return jsonList.map((json) => Post.fromJson(json)).toList();
      } else {
        // Handle error: API request failed
        debugPrint('Error: ${response.statusCode}');
        throw Exception(
            'Failed to load users'); // Or return an empty list: return [];
      }
    } catch (e) {
      // Handle error: Network or other exceptions
      debugPrint('Error: $e');
      throw Exception(
          'Failed to load users'); // Or return an empty list: return [];
    }
  }
}
