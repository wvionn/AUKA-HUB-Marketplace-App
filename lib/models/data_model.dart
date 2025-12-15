// Placeholder untuk data Product
class Product {
  final String name;
  final String productCode;
  final String price;
  final int stock;
  final String type;
  final String status;

  Product(this.name, this.productCode, this.price, this.stock, this.type, this.status);
}

// Placeholder untuk data Order
class Order {
  final String id;
  final String customerName;
  final String payment;
  final String location;
  final String status;
  final String contact;

  Order(this.id, this.customerName, this.payment, this.location, this.status, this.contact);
}

// Data Dummy
final List<Product> dummyProducts = [
  Product('Iphone 13 Pro', '#AU1346', 'Rp. 12.000.000', 12, 'Elektronik', 'Active'),
  Product('Stanley Tumbler', '#AU1346', 'Rp. 720.000', 100, 'Bottle', 'Active'),
  Product('Keripik Balado', '#AU1347', 'Rp. 25.000', 0, 'Makanan', 'Out of Stock'),
  Product('Celana Cutbray', '#AU1348', 'Rp. 158.000', 18, 'Fashion', 'Active'),
  Product('Kopi Janji Jiwa', '#AU1347', 'Rp. 28.000', 3, 'Minuman', 'Restock Soon'),
  Product('Kemeja Flanel', '#AU1350', 'Rp. 107.999', 6, 'Pakaian', 'Low Stock'),
];

final List<Order> dummyOrders = [
  Order('#25112', 'Putri Anjani', 'BCA', 'Pondok Indah, Jkt', 'Selesai', '085121314156'),
  Order('#25112', 'Putri Anjani', 'BCA', 'Pondok Indah, Jkt', 'Selesai', '085121314156'),
  Order('#25112', 'Putri Anjani', 'BCA', 'Pondok Indah, Jkt', 'Selesai', '085121314156'),
  Order('#25112', 'Putri Anjani', 'BCA', 'Pondok Indah, Jkt', 'Selesai', '085121314156'),
  Order('#25112', 'Putri Anjani', 'BCA', 'Pondok Indah, Jkt', 'Selesai', '085121314156'),
  Order('#25112', 'Putri Anjani', 'BCA', 'Pondok Indah, Jkt', 'Selesai', '085121314156'),
  Order('#25112', 'Putri Anjani', 'BCA', 'Pondok Indah, Jkt', 'Selesai', '085121314156'),
];