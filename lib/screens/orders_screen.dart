import 'package:flutter/material.dart';
import 'package:auka_hub_app/widgets/orders/order_list_table.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Header: Title, Search, Dropdowns
            Row(
              children: [
                const Text('Order Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const Spacer(),
                // Search Input
                Container(
                  width: 200,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      icon: Icon(Icons.search, size: 20, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                _buildDropdownButton('Today ▾'),
                const SizedBox(width: 10),
                _buildDropdownButton('2025 ▾'),
              ],
            ),
            const Divider(height: 30),
            // Order List Table
            const Expanded(
              child: OrderListTable(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Show All', style: TextStyle(color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}