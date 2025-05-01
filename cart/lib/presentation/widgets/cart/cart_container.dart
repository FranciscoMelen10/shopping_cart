import 'package:cart/models/cart.dart';
import 'package:cart/presentation/widgets/cart/item_cart.dart';
import 'package:cart/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Cart> cart = Provider.of<CartProvider>(context).cart;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child:
          cart.isEmpty
              ? Center(
                child: Text(
                  "No hay productos en el carrito",
                  style: TextStyle(fontSize: 18),
                ),
              )
              : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return ItemCart(
                    id: cart[index].id,
                    image: cart[index].image,
                    count: cart[index].count,
                    price: cart[index].price,
                    rate: cart[index].rate,
                    title: cart[index].title,
                    total: cart[index].count * cart[index].price,
                  );
                },
              ),
    );
  }
}
