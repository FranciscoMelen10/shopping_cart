import 'package:flutter/material.dart';
import 'package:cart/api/products.dart';
import 'package:cart/presentation/widgets/index.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late Future<List> _products;

  @override
  void initState() {
    super.initState();
    _products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final products = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(2),
              child: Wrap(
                children:
                    products.map((product) {
                      return ItemProduct(
                        id: product['id'],
                        title: product['title'],
                        price: product['price'],
                        rate: product['rating']['rate'],
                        description: product['description'],
                        image: product['image'],
                      );
                    }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
