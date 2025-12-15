import 'package:flutter/material.dart';
import 'dart:async'; 
import 'package:intl/intl.dart';

// 2. IMPORT MODEL & SERVICE
import '../models/product_model.dart';
import '../services/product_service.dart';
import '../screens/all_product_screen.dart'; // Import halaman baru
class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  // Path ke folder aset
  final String _assetPath = 'lib/widgets/assets/images';

  // Controller Text Input
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
  // --- LOGIKA SLIDER BANNER ---
  final PageController _bannerController = PageController();
  int _currentBannerIndex = 0;
  Timer? _timer;

  // --- 3. VARIABLE STATE UNTUK DATA PRODUK ---
  late Future<List<Product>> _futureProducts;

  // Data Mockup untuk Slide Banner
  final List<Map<String, String>> _bannerData = [
    {
      "title": "iPhone 14 Series",
      "subtitle": "Up to 10%\noff Voucher",
      "image": "iphone_banner.png", 
      "color": "black" 
    },
    {
      "title": "Samsung Galaxy",
      "subtitle": "New Era of\nSmartphones",
      "image": "samsung_banner.png",
      "color": "blue"
    },
    {
      "title": "Mega Sale 12.12",
      "subtitle": "Discount\nup to 50%",
      "image": "sale_banner.png",
      "color": "purple"
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
    // 4. PANGGIL API SAAT APLIKASI DIBUKA
    _futureProducts = ProductService().fetchProducts();
  }

  @override
  void dispose() {
    _timer?.cancel(); 
    _bannerController.dispose();
    _searchController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentBannerIndex < _bannerData.length - 1) {
        _currentBannerIndex++;
      } else {
        _currentBannerIndex = 0; 
      }

      if (_bannerController.hasClients) {
        _bannerController.animateToPage(
          _currentBannerIndex,
          duration: const Duration(milliseconds: 500), 
          curve: Curves.easeInOut, 
        );
      }
    });
  }

  // Helper Format Rupiah
  String formatRupiah(double price) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return format.format(price);
  }

  void _showFeatureNotAvailable(String featureName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$featureName diklik!'),
        duration: const Duration(milliseconds: 500),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.purple,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildNavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroBannerSlider(), 
            const SizedBox(height: 30),
            _buildCategories(),
            const SizedBox(height: 30),
            _buildRecommendations(), // <--- INI YANG KITA UPDATE JADI REAL DATA
            const SizedBox(height: 30),
            _buildFlashSales(),
            const SizedBox(height: 30),
            _buildPromoBanners(),
            const SizedBox(height: 50),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  // ================= 1. NAVBAR / HEADER =================
  PreferredSizeWidget _buildNavbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () => _showFeatureNotAvailable("Refresh Home"),
              child: Row(
                children: [
                  Image.asset('$_assetPath/logo_auka.png', scale: 0.8, height: 40),
                  const SizedBox(width: 8),
                  const Text("AukaHub", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple)),
                ],
              ),
            ),
            
            const SizedBox(width: 40),
            
            _buildNavLink("BERANDA", isActive: true, onTap: () {}),
            _buildNavLink("PRODUK", onTap: () => _showFeatureNotAvailable("Menu Produk")),
            _buildNavLink("ABOUT US", onTap: () => _showFeatureNotAvailable("Menu About Us")),
            
            const Spacer(),
            
            Container(
              width: 300, 
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: "What are you looking for?",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 10)
                      ),
                      onSubmitted: (value) => _showFeatureNotAvailable("Mencari: $value"),
                    ),
                  ),
                  InkWell(
                    onTap: () => _showFeatureNotAvailable("Search Button"),
                    child: const Icon(Icons.search, color: Colors.grey, size: 18),
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 20),
            IconButton(
              onPressed: () => _showFeatureNotAvailable("Wishlist"), 
              icon: const Icon(Icons.favorite_border, color: Colors.grey)
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () => _showFeatureNotAvailable("Keranjang Belanja"),
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavLink(String title, {bool isActive = false, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.purple : Colors.black87,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // ================= 2. HERO BANNER SLIDER (AUTO PLAY) =================
  Widget _buildHeroBannerSlider() {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _bannerController,
            itemCount: _bannerData.length,
            onPageChanged: (index) {
              setState(() {
                _currentBannerIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final banner = _bannerData[index];
              return Container(
                color: Colors.black, 
                child: Stack(
                  children: [
                    Positioned(
                      left: 100,
                      top: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(Icons.apple, color: Colors.white, size: 30),
                            const SizedBox(width: 10),
                            Text(banner["title"]!, style: const TextStyle(color: Colors.white, fontSize: 16)),
                          ]),
                          const SizedBox(height: 20),
                          Text(banner["subtitle"]!, style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold, height: 1.2)),
                          const SizedBox(height: 20),
                          
                          InkWell(
                            onTap: () => _showFeatureNotAvailable("Shop Now Banner $index"),
                            child: Row(children: const [
                              Text("Shop Now", style: TextStyle(color: Colors.white)),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 100,
                      bottom: 0,
                      child: _buildImagePlaceholder("Image: ${banner['image']}", width: 400, height: 300),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 0, right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_bannerData.length, (index) {
                return GestureDetector(
                  onTap: () {
                    _bannerController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    _timer?.cancel();
                    _startAutoSlide();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentBannerIndex == index ? 12 : 8,
                    height: _currentBannerIndex == index ? 12 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentBannerIndex == index ? Colors.red : Colors.grey,
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  // ================= 3. CATEGORIES =================
  Widget _buildCategories() {
    final categories = [
      {"name": "Phones", "icon": Icons.phone_iphone},
      {"name": "Makanan", "icon": Icons.fastfood},
      {"name": "Skincare", "icon": Icons.face},
      {"name": "Elektronik", "icon": Icons.computer},
      {"name": "Pakaian", "icon": Icons.checkroom},
      {"name": "Lemari", "icon": Icons.door_sliding_outlined}, 
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () => _showFeatureNotAvailable("Scroll Kiri"), icon: const Icon(Icons.arrow_back)),
          ...categories.map((cat) => _buildCategoryItem(cat["name"] as String, cat["icon"] as IconData, cat["name"] == "Phones")),
          IconButton(onPressed: () => _showFeatureNotAvailable("Scroll Kanan"), icon: const Icon(Icons.arrow_forward)),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String name, IconData icon, bool isActive) {
    return InkWell(
      onTap: () => _showFeatureNotAvailable("Kategori $name"),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFCE93D8) : Colors.white,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: isActive ? Colors.white : Colors.black87),
            const SizedBox(height: 10),
            Text(name, style: TextStyle(color: isActive ? Colors.white : Colors.black87)),
          ],
        ),
      ),
    );
  }

  // ================= 4. RECOMMENDATIONS (UPDATED WITH REAL API) =================
  Widget _buildRecommendations() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Rekomendasi untuk kamu", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          
          // --- GANTI ROW HARDCODED DENGAN FUTUREBUILDER ---
          FutureBuilder<List<Product>>(
            future: _futureProducts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text("Belum ada produk.");
              }

              // Data dari API
              final products = snapshot.data!;

              // Batasi tampilan cuma 4 produk biar rapi (sesuai desain awal)
              final displayProducts = products.take(4).toList();

              return GridView.builder(
                shrinkWrap: true, // Biar tidak error di dalam SingleScrollView
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 Kolom sesuai desain awal
                  childAspectRatio: 0.75, // Rasio kartu
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: displayProducts.length,
                itemBuilder: (context, index) {
                  final product = displayProducts[index];
                  // Gunakan widget kartu yg sudah dimodif dikit buat nerima object Product
                  return _buildRealProductCard(product);
                },
              );
            },
          ),
          
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () => _showFeatureNotAvailable("View All Products"), 
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFCE93D8), foregroundColor: Colors.white),
              child: const Text("View All Products"),
            ),
          )
        ],
      ),
    );
  }

  // --- WIDGET KARTU PRODUK UNTUK DATA ASLI ---
  Widget _buildRealProductCard(Product product) {
    return InkWell(
      onTap: () => _showFeatureNotAvailable("Detail: ${product.name}"),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                // Pakai placeholder karena belum ada URL gambar asli
                child: _buildImagePlaceholder(product.category, height: 120, width: 120),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.name, 
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1, 
              overflow: TextOverflow.ellipsis
            ),
            Text(
              formatRupiah(product.price), 
              style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)
            ),
            Row(children: [
              const Icon(Icons.store, color: Colors.grey, size: 14),
              const SizedBox(width: 5),
              Expanded(child: Text(product.sellerCity, style: const TextStyle(fontSize: 10, color: Colors.grey), maxLines: 1, overflow: TextOverflow.ellipsis))
            ])
          ],
        ),
      ),
    );
  }

  // --- WIDGET KARTU LAMA (UNTUK FLASH SALE DUMMY) ---
  Widget _buildProductCard(String name, String price, String imgAlt) {
    return InkWell(
      onTap: () => _showFeatureNotAvailable("Detail Produk: $name"),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: _buildImagePlaceholder(imgAlt, height: 120, width: 120)),
            const SizedBox(height: 10),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(price, style: const TextStyle(color: Colors.purple)),
            Row(children: const [
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star, color: Colors.amber, size: 14),
              SizedBox(width: 5),
              Text("(200)", style: TextStyle(fontSize: 10, color: Colors.grey))
            ])
          ],
        ),
      ),
    );
  }

  // ================= 5. FLASH SALES =================
  Widget _buildFlashSales() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Flash Sales", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(width: 30),
              _buildTimerBox("03", "Days"),
              const Text(" : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              _buildTimerBox("23", "Hours"),
               const Text(" : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              _buildTimerBox("19", "Minutes"),
               const Text(" : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              _buildTimerBox("56", "Seconds"),
              const Spacer(),
              InkWell(
                onTap: () => _showFeatureNotAvailable("Lihat Semua Flash Sale"),
                child: const Text("Lihat Semua", style: TextStyle(color: Colors.purple))
              ),
            ],
          ),
          const SizedBox(height: 20),
           Row(
            children: [
              Expanded(child: _buildProductCard("Ziyatta Hijab", "Rp 10.964", "hijab.png")),
              const SizedBox(width: 20),
              Expanded(child: _buildProductCard("Parfume Dark", "Rp 231.900", "parfume.png")),
              const SizedBox(width: 20),
              Expanded(child: _buildProductCard("Asus Vivobook", "Rp 2.895.000", "laptop.png")),
              const SizedBox(width: 20),
              Expanded(child: _buildProductCard("Kemeja Korea", "Rp 117.000", "shirt.png")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimerBox(String val, String label) {
    return Column(
      children: [
        Text(val, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  // ================= 6. PROMO BANNERS =================
  Widget _buildPromoBanners() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        children: [
          Expanded(child: InkWell(onTap: () => _showFeatureNotAvailable("Promo Tas"), child: _buildImagePlaceholder("Banner Tas Diskon", height: 200))),
          const SizedBox(width: 20),
          Expanded(child: InkWell(onTap: () => _showFeatureNotAvailable("Promo Elektronik"), child: _buildImagePlaceholder("Banner Elektronik", height: 200))),
          const SizedBox(width: 20),
          Expanded(child: InkWell(onTap: () => _showFeatureNotAvailable("Promo Makanan"), child: _buildImagePlaceholder("Banner Makanan", height: 200))),
        ],
      ),
    );
  }

  // ================= 7. FOOTER =================
  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      color: const Color(0xFFB39DDB), 
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 100),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Exclusive", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text("Subscribe", style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 10),
                  const Text("Get 10% off your first order", style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 15),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: "Enter your email", 
                              hintStyle: TextStyle(color: Colors.white54), 
                              border: InputBorder.none
                            )
                          )
                        ),
                        InkWell(
                          onTap: () {
                             if(_emailController.text.isNotEmpty) {
                               _showFeatureNotAvailable("Subscribed: ${_emailController.text}");
                               _emailController.clear();
                             }
                          },
                          child: const Icon(Icons.send, color: Colors.white)
                        ),
                      ],
                    ),
                  )
                ],
              ),
              _buildFooterLinks("Produk", ["Semua Produk", "Fashion", "Pakaian"]),
              _buildFooterLinks("Account", ["My Account", "Login / Register", "Cart", "Wishlist", "Shop"]),
              _buildFooterLinks("Quick Link", ["Privacy Policy", "Terms Of Use", "FAQ", "Contact"]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Download App", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  _buildImagePlaceholder("QR Code + Stores", height: 80, width: 150),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      InkWell(onTap: () => _showFeatureNotAvailable("Facebook"), child: const Icon(Icons.facebook, color: Colors.white)), 
                      const SizedBox(width: 10),
                      InkWell(onTap: () => _showFeatureNotAvailable("Instagram"), child: const Icon(Icons.camera_alt, color: Colors.white)), 
                      const SizedBox(width: 10), 
                      InkWell(onTap: () => _showFeatureNotAvailable("LinkedIn"), child: const Icon(Icons.work, color: Colors.white)),
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 40),
          const Text("© Copyright Rimel 2025. Auka Hub", style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }

  Widget _buildFooterLinks(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        ...links.map((link) => InkWell(
          onTap: () => _showFeatureNotAvailable("Link: $link"),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(link, style: const TextStyle(color: Colors.white70)),
          ),
        )),
      ],
    );
  }

  // ================= UTILS: IMAGE PLACEHOLDER =================
  Widget _buildImagePlaceholder(String altText, {double? width, double? height}) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "ALT: $altText",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black54, fontSize: 12),
        ),
      ),
    );
  }
}