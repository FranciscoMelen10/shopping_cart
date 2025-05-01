import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart/models/cart.dart';
import 'package:cart/providers/cart_provider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    final id = arg['id'];
    final title = arg['title'];
    final price = arg['price'];
    final description = arg['description'];
    final rate = arg['rate'];
    final image = arg['image'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Detalle del producto",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(image, height: 200),
              SizedBox(height: 20),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.green),
                      Text(
                        '$price',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        "$rate",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              Text(
                description,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  final Cart newProduct = Cart(
                    id: id,
                    count: 1,
                    image: image,
                    price: price,
                    rate: rate,
                    title: title,
                    total: price,
                  );
                  Provider.of<CartProvider>(
                    context,
                    listen: false,
                  ).addProductsCart(newProduct);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(400, 50),
                ),
                child: Text(
                  'Añadir al carrito',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
