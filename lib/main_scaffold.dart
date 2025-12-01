<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/product_screen.dart';
import 'screens/orders_screen.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final Widget screen;

  MenuItem(this.title, this.icon, this.screen);
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<MenuItem> _menuItems = [
    MenuItem('Dashboard', Icons.dashboard, const DashboardScreen()),
    MenuItem('Product', Icons.shopping_bag, const ProductScreen()),
    MenuItem('Chat', Icons.chat, const Center(child: Text('Chat Screen'))),
    MenuItem('Customer', Icons.person, const Center(child: Text('Customer Screen'))),
    MenuItem('Income', Icons.wallet, const Center(child: Text('Income Screen'))),
    MenuItem('Promo', Icons.discount, const Center(child: Text('Promo Screen'))),
    MenuItem('Order History', Icons.history, const OrdersScreen()), // Menggunakan OrdersScreen
    MenuItem('Analytics', Icons.analytics, const Center(child: Text('Analytics Screen'))),
    MenuItem('Setting', Icons.settings, const Center(child: Text('Setting Screen'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          _buildSidebar(),
          // Main Content
          Expanded(
            child: Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: Container(
                    color: const Color(0xFFF9F9F9), // Background color
                    child: _menuItems[_selectedIndex].screen,
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
      width: 250,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // Placeholder Image/Logo
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6E0FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('A', style: TextStyle(color: Color(0xFF8B64F8), fontWeight: FontWeight.bold))),
                ),
                const SizedBox(width: 8),
                const Text(
                  'AukaHub',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B64F8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Menu Items
          Expanded(
            child: ListView.builder(
              itemCount: _menuItems.length,
              itemBuilder: (context, index) {
                return _SidebarItem(
                  item: _menuItems[index],
                  isSelected: _selectedIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
          // Log Out Section
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(Icons.logout, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  'Log Out',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        _menuItems[_selectedIndex].title,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.grey),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.chat_bubble_outline, color: Colors.grey),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.grey),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        // Profile Icon and Name
        Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Placeholder
              backgroundColor: Color(0xFFE6E0FF),
              child: Text('A', style: TextStyle(color: Color(0xFF8B64F8))),
            ),
            const SizedBox(width: 8),
            const Text(
              'Aisyah Putri',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final MenuItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE6E0FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            children: [
              Icon(
                item.icon,
                color: isSelected ? const Color(0xFF8B64F8) : Colors.grey,
                size: 20,
              ),
              const SizedBox(width: 15),
              Text(
                item.title,
                style: TextStyle(
                  color: isSelected ? const Color(0xFF8B64F8) : Colors.black54,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
=======
import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/product_screen.dart';
import 'screens/orders_screen.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final Widget screen;

  MenuItem(this.title, this.icon, this.screen);
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<MenuItem> _menuItems = [
    MenuItem('Dashboard', Icons.dashboard, const DashboardScreen()),
    MenuItem('Product', Icons.shopping_bag, const ProductScreen()),
    MenuItem('Chat', Icons.chat, const Center(child: Text('Chat Screen'))),
    MenuItem('Customer', Icons.person, const Center(child: Text('Customer Screen'))),
    MenuItem('Income', Icons.wallet, const Center(child: Text('Income Screen'))),
    MenuItem('Promo', Icons.discount, const Center(child: Text('Promo Screen'))),
    MenuItem('Order History', Icons.history, const OrdersScreen()), // Menggunakan OrdersScreen
    MenuItem('Analytics', Icons.analytics, const Center(child: Text('Analytics Screen'))),
    MenuItem('Setting', Icons.settings, const Center(child: Text('Setting Screen'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          _buildSidebar(),
          // Main Content
          Expanded(
            child: Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: Container(
                    color: const Color(0xFFF9F9F9), // Background color
                    child: _menuItems[_selectedIndex].screen,
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
      width: 250,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // Placeholder Image/Logo
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6E0FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('A', style: TextStyle(color: Color(0xFF8B64F8), fontWeight: FontWeight.bold))),
                ),
                const SizedBox(width: 8),
                const Text(
                  'AukaHub',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B64F8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Menu Items
          Expanded(
            child: ListView.builder(
              itemCount: _menuItems.length,
              itemBuilder: (context, index) {
                return _SidebarItem(
                  item: _menuItems[index],
                  isSelected: _selectedIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
          // Log Out Section
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(Icons.logout, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  'Log Out',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        _menuItems[_selectedIndex].title,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: Colors.grey),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.chat_bubble_outline, color: Colors.grey),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.grey),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        // Profile Icon and Name
        Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Placeholder
              backgroundColor: Color(0xFFE6E0FF),
              child: Text('A', style: TextStyle(color: Color(0xFF8B64F8))),
            ),
            const SizedBox(width: 8),
            const Text(
              'Aisyah Putri',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final MenuItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE6E0FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            children: [
              Icon(
                item.icon,
                color: isSelected ? const Color(0xFF8B64F8) : Colors.grey,
                size: 20,
              ),
              const SizedBox(width: 15),
              Text(
                item.title,
                style: TextStyle(
                  color: isSelected ? const Color(0xFF8B64F8) : Colors.black54,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
>>>>>>> 7e16e65bf2e29a7913859cdd8fcb34706a94c000
}