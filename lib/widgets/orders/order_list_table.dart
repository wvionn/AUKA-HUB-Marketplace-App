<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:auka_hub_app/models/data_model.dart';

class OrderListTable extends StatelessWidget {
  const OrderListTable({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> columns = ['Order ID', 'Customer Name', 'Payment', 'Location', 'Status', 'Contact'];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columnSpacing: 30,
        dataRowMinHeight: 60,
        dataRowMaxHeight: 60,
        headingRowColor: WidgetStateProperty.all(Colors.grey.shade50),
        columns: columns
            .map((col) => DataColumn(
                  label: Text(col, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ))
            .toList(),
        rows: dummyOrders.map((order) => _buildDataRow(order)).toList(),
      ),
    );
  }

  DataRow _buildDataRow(Order order) {
    return DataRow(
      cells: [
        DataCell(Text(order.id, style: const TextStyle(fontWeight: FontWeight.bold))),
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
              Text(order.customerName),
            ],
          ),
        ),
        DataCell(Text(order.payment)),
        DataCell(Text(order.location)),
        DataCell(_buildStatusChip(order.status)),
        DataCell(Text(order.contact)),
      ],
    );
  }

  Widget _buildStatusChip(String status) {
    // Di desain hanya ada status 'Selesai' (Hijau)
    Color bgColor = Colors.green.withOpacity(0.1);
    Color textColor = Colors.green;

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
=======
import 'package:flutter/material.dart';
import 'package:auka_hub_app/models/data_model.dart';

class OrderListTable extends StatelessWidget {
  const OrderListTable({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> columns = ['Order ID', 'Customer Name', 'Payment', 'Location', 'Status', 'Contact'];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columnSpacing: 30,
        dataRowMinHeight: 60,
        dataRowMaxHeight: 60,
        headingRowColor: WidgetStateProperty.all(Colors.grey.shade50),
        columns: columns
            .map((col) => DataColumn(
                  label: Text(col, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ))
            .toList(),
        rows: dummyOrders.map((order) => _buildDataRow(order)).toList(),
      ),
    );
  }

  DataRow _buildDataRow(Order order) {
    return DataRow(
      cells: [
        DataCell(Text(order.id, style: const TextStyle(fontWeight: FontWeight.bold))),
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
              Text(order.customerName),
            ],
          ),
        ),
        DataCell(Text(order.payment)),
        DataCell(Text(order.location)),
        DataCell(_buildStatusChip(order.status)),
        DataCell(Text(order.contact)),
      ],
    );
  }

  Widget _buildStatusChip(String status) {
    // Di desain hanya ada status 'Selesai' (Hijau)
    Color bgColor = Colors.green.withOpacity(0.1);
    Color textColor = Colors.green;

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
>>>>>>> 7e16e65bf2e29a7913859cdd8fcb34706a94c000
}