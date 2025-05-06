import 'package:cart/models/cart.dart';
import 'package:cart/presentation/widgets/index.dart';
import 'package:cart/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Cart> cart = Provider.of<CartProvider>(context).cart;
    double total = cart.fold(
      0,
      (previousValue, element) => previousValue + element.count * element.price,
    );

    double screenWidth = MediaQuery.of(context).size.width;
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
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        total += cart[index].count * cart[index].price;
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
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: screenWidth,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.attach_money),
                                Text(
                                  total.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              Colors.black,
                            ),
                          ),
                          onPressed: () {
                            customToast(
                              "Muchas gracias por tu compra!",
                              Colors.green,
                            );
                            Provider.of<CartProvider>(
                              context,
                              listen: false,
                            ).removeCart();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.shop, color: Colors.white),
                              SizedBox(width: 10),
                              Text(
                                "Finalizar compra",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
