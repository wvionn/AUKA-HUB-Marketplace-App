import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  // Ganti URL sesuai settingan kamu
  // Emulator: 10.0.2.2
  // HP Fisik: Pakai IP Laptop (misal 192.168.1.5)
  final String baseUrl = "http://localhost/aukahub_API/api/produk/read_all.php";

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        // Ambil array 'data' dari JSON
        List<dynamic> listData = data['data'];

        // Ubah jadi List<Product>
        return listData.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('Gagal memuat produk');
      }
    } catch (e) {
      throw Exception('Error koneksi: $e');
    }
  }
}