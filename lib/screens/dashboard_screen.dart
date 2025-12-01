import 'package:flutter/material.dart';
import 'package:auka_hub_app/widgets/dashboard/info_card.dart';
import 'package:auka_hub_app/widgets/dashboard/top_seller_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting and Shift Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Good morning, Aisyah Putri',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Your today's shift 08.00 am - 4.00 pm",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 25),

          // Info Cards Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Available Balance Card
              Expanded(
                child: InfoCard(
                  title: 'Available Balance',
                  amount: 'Rp. 100.000.000',
                  icon: Icons.credit_card,
                  color: Color(0xFF8B64F8),
                  subtitle: 'Expiry by 28, Nov 2025',
                ),
              ),
              SizedBox(width: 20),
              // Total Received Card
              Expanded(
                child: InfoCard(
                  title: 'Total Received',
                  amount: 'Rp. 150.000.000',
                  icon: Icons.arrow_downward,
                  color: Color(0xFF6B4D8D),
                  subtitle: 'Updated on 28 Nov 2025',
                ),
              ),
              SizedBox(width: 20),
              // Total Spend Card
              Expanded(
                child: InfoCard(
                  title: 'Total Spend',
                  amount: 'Rp. 12.500.000',
                  icon: Icons.arrow_upward,
                  color: Color(0xFF6B4D8D),
                  subtitle: 'Updated on 28 Nov 2025',
                ),
              ),
              SizedBox(width: 20),
              // Total Balance Card
              Expanded(
                child: InfoCard(
                  title: 'Total Balance',
                  amount: 'Rp. 150.000.000',
                  icon: Icons.arrow_upward,
                  color: Color(0xFF6B4D8D),
                  subtitle: 'Updated on 28 Nov 2025',
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),

          // Sales Chart and Top Seller
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sales Chart Placeholder
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text('Sales Chart Placeholder', style: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Top Seller List
                const TopSellerList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}