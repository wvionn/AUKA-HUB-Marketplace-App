import 'package:flutter/material.dart';
import 'package:auka_hub_app/models/data_model.dart';

class ProductListTable extends StatelessWidget {
  const ProductListTable({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> columns = ['Product Name', 'Product', 'Price', 'Stock', 'Type', 'Status', 'Action'];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columnSpacing: 30,
        dataRowMinHeight: 60,
        dataRowMaxHeight: 60,
        headingRowColor: WidgetStateProperty.all(Colors.grey.shade50),
        columns: columns
            .map((col) => DataColumn(
                  label: Row(
                    children: [
                      Text(col, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      if (col != 'Action') const Icon(Icons.swap_vert, size: 16, color: Colors.grey),
                    ],
                  ),
                ))
            .toList(),
        rows: dummyProducts.map((product) => _buildDataRow(product)).toList(),
      ),
    );
  }

  DataRow _buildDataRow(Product product) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0E5FF),
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/product_image_1.png'), // Placeholder
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Text(product.name),
            ],
          ),
        ),
        DataCell(Text(product.productCode)),
        DataCell(Text(product.price)),
        DataCell(Text('${product.stock} Unit')),
        DataCell(Text(product.type)),
        DataCell(_buildStatusChip(product.status)),
        DataCell(IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {})),
      ],
    );
  }

  Widget _buildStatusChip(String status) {
    Color bgColor;
    Color textColor;

    switch (status) {
      case 'Active':
        bgColor = Colors.green.withOpacity(0.1);
        textColor = Colors.green;
        break;
      case 'Out of Stock':
        bgColor = Colors.red.withOpacity(0.1);
        textColor = Colors.red;
        break;
      case 'Restock Soon':
        bgColor = Colors.amber.withOpacity(0.1);
        textColor = Colors.amber.shade800;
        break;
      case 'Low Stock':
        bgColor = Colors.orange.withOpacity(0.1);
        textColor = Colors.orange.shade800;
        break;
      default:
        bgColor = Colors.grey.withOpacity(0.1);
        textColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        status,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}