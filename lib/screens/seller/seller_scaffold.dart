import 'package:flutter/material.dart';
import '../auth/login_screen.dart'; 

class SellerScaffold extends StatefulWidget {
  const SellerScaffold({super.key});

  @override
  State<SellerScaffold> createState() => _SellerScaffoldState();
}

class _SellerScaffoldState extends State<SellerScaffold> {
  int _selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================= SIDEBAR MENU PENJUAL =================
          _buildSidebar(),

          // ================= KONTEN KANAN =================
          Expanded(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(30.0),
                    child: _buildDashboardContent(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 260,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.storefront, color: Colors.purple, size: 30), // Ikon Toko
                const SizedBox(width: 10),
                Text("Seller Centre", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple[800])),
              ],
            ),
          ),
          const SizedBox(height: 50),

          // Menu sesuai Gambar Dashboard Ungu
          _buildMenuItem(0, Icons.grid_view, "Dashboard"),
          _buildMenuItem(1, Icons.inventory_2_outlined, "Product"),
          _buildMenuItem(2, Icons.chat_bubble_outline, "Chat"),
          _buildMenuItem(3, Icons.people_outline, "Customer"),
          _buildMenuItem(4, Icons.account_balance_wallet_outlined, "Income"),
          _buildMenuItem(5, Icons.local_offer_outlined, "Promo"),
          _buildMenuItem(6, Icons.history, "Order History"),
          _buildMenuItem(7, Icons.analytics_outlined, "Analytics"),
          _buildMenuItem(8, Icons.settings_outlined, "Setting"),
          
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text("Log Out", style: TextStyle(color: Colors.redAccent)),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(int index, IconData icon, String title) {
    bool isActive = _selectedIndex == index;
    return ListTile(
      leading: Icon(icon, color: isActive ? const Color(0xFFAB47BC) : Colors.grey),
      title: Text(title, style: TextStyle(color: isActive ? const Color(0xFFAB47BC) : Colors.grey, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      onTap: () => setState(() => _selectedIndex = index),
      selected: isActive,
      selectedTileColor: Colors.purple.withOpacity(0.05),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Dashboard Penjual", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Row(
            children: [
              IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
              const SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: const [
                    CircleAvatar(radius: 16, backgroundImage: NetworkImage("https://via.placeholder.com/150")),
                    SizedBox(width: 10),
                    Text("Toko Aisyah", style: TextStyle(fontWeight: FontWeight.bold)), // Nama Toko
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDashboardContent() {
    if (_selectedIndex != 0) return Center(child: Text("Halaman ${_selectedIndex} sedang dibuat..."));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Overview Penjualan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 30),

        // Statistik Kartu
        SizedBox(
          height: 180,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: const Color(0xFFB39DDB), borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Saldo Dapat Ditarik", style: TextStyle(color: Colors.white)),
                      const Text("Rp. 100.000.000", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      const Text("Withdraw segera", style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(child: _buildStatCard("Total Pesanan", "150 Order", Icons.shopping_bag)),
              const SizedBox(width: 20),
              Expanded(child: _buildStatCard("Produk Terjual", "1,250 Unit", Icons.inventory)),
              const SizedBox(width: 20),
              Expanded(child: _buildStatCard("Pendapatan Kotor", "Rp 150Jt", Icons.monetization_on)),
            ],
          ),
        ),
        const SizedBox(height: 30),
        
        // Grafik & Top Produk
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 350,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: const Center(child: Text("Grafik Penjualan (Placeholder)")),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: Container(
                height: 350,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Produk Terlaris", style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    _buildTopSellerItem("1", "Stanley Tumbler", "400 pcs"),
                    _buildTopSellerItem("2", "iPhone 11", "350 pcs"),
                    _buildTopSellerItem("3", "Kemeja", "150 pcs"),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFF7B1FA2), borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: Colors.white),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white70)),
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTopSellerItem(String rank, String name, String units) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Text(rank, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 15),
          const CircleAvatar(backgroundColor: Colors.purple, radius: 15, child: Icon(Icons.shopping_bag, size: 15, color: Colors.white)),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            Text(units, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ])
        ],
      ),
    );
  }
}