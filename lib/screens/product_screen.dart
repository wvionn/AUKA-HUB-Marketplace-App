import 'package:flutter/material.dart';
import 'package:auka_hub_app/widgets/product/product_list_table.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
            // Header: Showing, Filter, Export, Add New Product
            Row(
              children: [
                const Text('Product', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const Spacer(),
                const Text('Showing'),
                const SizedBox(width: 8),
                _buildDropdownButton('10 ▾'),
                const SizedBox(width: 15),
                _buildHeaderButton('Filter', Icons.filter_list, Colors.grey.shade300, Colors.black),
                const SizedBox(width: 10),
                _buildHeaderButton('Export', Icons.upload_file, Colors.grey.shade300, Colors.black),
                const SizedBox(width: 10),
                _buildHeaderButton('Add New Product', Icons.add, const Color(0xFF8B64F8), Colors.white),
              ],
            ),
            const Divider(height: 30),
            // Product List Table
            const Expanded(
              child: ProductListTable(),
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

  Widget _buildHeaderButton(String text, IconData icon, Color bgColor, Color textColor) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: textColor, size: 20),
      label: Text(text, style: TextStyle(color: textColor)),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    );
  }
}