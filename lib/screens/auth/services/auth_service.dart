import 'dart:convert';
import 'dart:io'; // Import wajib untuk deteksi OS (Android/Windows)
import 'package:http/http.dart' as http;

class AuthService {
  // --- 1. LOGIC PENENTUAN URL OTOMATIS ---
  String get baseUrl {
    if (Platform.isAndroid) {
      // Khusus Emulator Android
      return "http://10.0.2.2/aukahub_API/api";
    } else {
      // Khusus Windows Desktop, iOS Simulator, atau Web
      return "http://localhost/aukahub_API/api";
    }
  }

  // --- 2. FUNGSI LOGIN ---
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/login.php');

    try {
      print("Mencoba login ke: $url"); // Debugging: Cek console untuk lihat URL

      final response = await http.post(
        url,
        body: jsonEncode({"email": email, "password": password}),
      );

      print("Response Server: ${response.body}"); // Debugging: Lihat balasan PHP

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          "success": false, 
          "message": "Error Server: ${response.statusCode}"
        };
      }
    } catch (e) {
      print("Error Koneksi: $e");
      return {
        "success": false, 
        "message": "Gagal terhubung ke server. Pastikan XAMPP nyala."
      };
    }
  }

  // --- 3. FUNGSI REGISTER ---
  Future<Map<String, dynamic>> register(String nama, String email, String password, String peran) async {
    final url = Uri.parse('$baseUrl/auth/register.php');

    try {
      print("Mencoba register ke: $url");

      final response = await http.post(
        url,
        body: jsonEncode({
          "nama": nama,
          "email": email,
          "password": password,
          "peran": peran,
          "no_hp": "-",   // Dummy
          "alamat": "-"   // Dummy
        }),
      );

      print("Response Register: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"success": false, "message": "Error Server: ${response.statusCode}"};
      }
    } catch (e) {
      return {"success": false, "message": "Gagal terhubung: $e"};
    }
  }
}