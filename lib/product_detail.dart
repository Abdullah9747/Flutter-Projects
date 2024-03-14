import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedsize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.product['imageUrl'],
              height: 250,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "\$${widget.product['price']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      itemCount: (widget.product['sizes'] as List).length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final size = (widget.product['sizes'] as List)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedsize = size;
                              });
                            },
                            child: Chip(
                              backgroundColor: selectedsize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : const Color.fromRGBO(245, 247, 249, 1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              label: Text(
                                (size.toString()),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      if (selectedsize != 0) {
                        Provider.of<CartProvider>(context, listen: false)
                            .addproduct(
                          {
                            'id': widget.product['id'],
                            'title': widget.product['title'],
                            'price': widget.product['price'],
                            'imageUrl': widget.product['imageUrl'],
                            'company': widget.product['company'],
                            'size': selectedsize,
                          },
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Product Added to Cart"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Plz Select a Size!"),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
