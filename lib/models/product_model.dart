class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String sku;
  final String category;
  final String sellerName;
  final String sellerCity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.sku,
    required this.category,
    required this.sellerName,
    required this.sellerCity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id_produk'].toString(),
      name: json['nama_produk'],
      description: json['deskripsi'] ?? 'Tidak ada deskripsi',
      // Pastikan harga diubah ke double (aman dari String/Int)
      price: double.parse(json['harga'].toString()),
      stock: int.parse(json['stok'].toString()),
      sku: json['kode_sku'] ?? '-',
      category: json['nama_kategori'] ?? 'Umum',
      sellerName: json['nama_toko'] ?? 'Unknown Seller',
      sellerCity: json['lokasi_toko'] ?? 'Indonesia',
    );
  }

  get unitsSold => null;
}