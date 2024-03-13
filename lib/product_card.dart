import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageURL;
  final Color backgroundcolor;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imageURL,
      required this.backgroundcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "\$$price",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            imageURL,
            height: 200,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
