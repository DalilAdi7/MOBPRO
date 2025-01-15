import 'package:shared_preferences/shared_preferences.dart'; // Pastikan sudah diimpor

class LocalStorage {
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance(); // Ambil instance SharedPreferences
    await prefs.setString('token', token); // Simpan token
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token'); // Ambil token yang disimpan
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Hapus token
  }
}
