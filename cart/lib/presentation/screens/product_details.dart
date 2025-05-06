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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Image.network(image, height: 200),
                SizedBox(height: 20),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_money, color: Colors.green),
                    Text('$price', style: TextStyle(fontSize: 18)),
                    SizedBox(width: 10),
                    Icon(Icons.star, color: Colors.yellow),
                    Text("$rate", style: TextStyle(fontSize: 18)),
                  ],
                ),

                SizedBox(height: 20),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 40),

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
                    minimumSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Añadir al carrito',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
