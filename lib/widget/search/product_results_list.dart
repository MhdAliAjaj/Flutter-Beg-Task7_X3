import 'package:flutter/material.dart';

import '../../model/product_model.dart';

class ProductResultsList extends StatelessWidget {
  final List<Product> products;
  const ProductResultsList({super.key,
    required this.products,
   });

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final p = products[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  p.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  p.title,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Text(
                "\$${p.price}",
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );;
  }
}
