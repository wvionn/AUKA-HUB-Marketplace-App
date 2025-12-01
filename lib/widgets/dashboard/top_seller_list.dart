<<<<<<< HEAD
import 'package:flutter/material.dart';

class TopSellerList extends StatelessWidget {
  const TopSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy Top Seller
    final List<Map<String, dynamic>> topSellers = [
      {'name': 'Stanley', 'units': 4.2},
      {'name': 'Iphone 11', 'units': 3.8},
      {'name': 'Pakailan', 'units': 3.5},
      {'name': 'Skincare', 'units': 2.8},
    ];

    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '⭐ Top Seller Product',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // Karena listnya pendek
              itemCount: topSellers.length,
              itemBuilder: (context, index) {
                final item = topSellers[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      // Rank Number
                      Container(
                        width: 25,
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Product Image Placeholder
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0E5FF),
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/product_image_1.png'), // Placeholder
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Product Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                           Text(
                              '${item['units']} Units',
                              style: const TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
=======
import 'package:flutter/material.dart';

class TopSellerList extends StatelessWidget {
  const TopSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy Top Seller
    final List<Map<String, dynamic>> topSellers = [
      {'name': 'Stanley', 'units': 4.2},
      {'name': 'Iphone 11', 'units': 3.8},
      {'name': 'Pakailan', 'units': 3.5},
      {'name': 'Skincare', 'units': 2.8},
    ];

    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '⭐ Top Seller Product',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // Karena listnya pendek
              itemCount: topSellers.length,
              itemBuilder: (context, index) {
                final item = topSellers[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      // Rank Number
                      Container(
                        width: 25,
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Product Image Placeholder
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0E5FF),
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/product_image_1.png'), // Placeholder
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Product Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                           Text(
                              '${item['units']} Units',
                              style: const TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
>>>>>>> 7e16e65bf2e29a7913859cdd8fcb34706a94c000
}