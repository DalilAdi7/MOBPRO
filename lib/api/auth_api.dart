import 'dart:convert'; // Untuk manipulasi JSON
import 'package:http/http.dart' as http; // Library HTTP untuk API

class AuthAPI {
  static const baseUrl = 'https://reqres.in/api'; // Ganti dengan URL API Anda

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Parsing JSON jika sukses
    } else {
      throw Exception('Login failed: ${response.body}'); // Tampilkan pesan error
    }
  }
}
