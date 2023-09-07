import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String flavor;
  final String price;
  final color;
  final String imageName;

  const Tile(
      {super.key,
      required this.flavor,
      required this.price,
      required this.color,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color[50],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: color[100],
                  ),
                  child: Text(
                    '\$$price',
                    style: TextStyle(
                        color: color[800], fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
              child: Image.asset(imageName),
            ),
            Text(flavor,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Text('Dunkins',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[600])),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: Colors.pink[400]),
                  Icon(Icons.add, color: Colors.grey[800])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
