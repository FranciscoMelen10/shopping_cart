import 'package:cart/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCart extends StatelessWidget {
  final int id;
  final String title;
  final num price;
  final num rate;
  final num total;
  final int count;
  final String image;

  const ItemCart({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.total,
    required this.rate,
    required this.count,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            children: [
              Image.network(image, height: 100, width: 100),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.attach_money, color: Colors.black),
                            Text(
                              '$price',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
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
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Provider.of<CartProvider>(
                                    context,
                                    listen: false,
                                  ).incremetCount(id);
                                },
                                child: Icon(Icons.add, color: Colors.black),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "$count",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Provider.of<CartProvider>(
                                    context,
                                    listen: false,
                                  ).decrementCount(id);
                                },
                                child: Icon(Icons.remove, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money, color: Colors.black),

                            Text(
                              total.toStringAsFixed(2),
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          right: 5,
          top: 5,
          child: IconButton(
            onPressed: () {
              Provider.of<CartProvider>(
                context,
                listen: false,
              ).deleteProduct(id);
            },
            icon: Icon(Icons.delete, color: Colors.red,),
          ),
        ),
      ],
    );
  }
}
