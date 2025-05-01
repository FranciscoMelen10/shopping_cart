import 'package:flutter/material.dart';

class ItemProduct extends StatelessWidget {
  final int id;
  final String title;
  final num price;
  final num rate;
  final String description;
  final String image;

  const ItemProduct({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.rate,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(5),
        height: 240,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(image, height: 100),
            Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
            ),

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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/product_details',
                  arguments: {
                    "id": id,
                    "title": title,
                    "price": price,
                    "description": description,
                    "image": image,
                    "rate": rate,
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(200, 30),
              ),
              child: Text(
                'Ver Detalles',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
