import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Api list.dart';


Future<bool> signIn(String username, String password) async {
  final url = Uri.parse(ApiList.login!);
  try {
    final client = http.Client();

    final response = await client.post(
      url,
      body: json.encode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      // Handle non-200 status codes (e.g., show an error message)
      print('Error: ${response.statusCode} - ${response.body}');
      return false;
    }
  } catch (error) {
    // Handle exceptions
    print('Error: $error');
    return false;
  }
}

