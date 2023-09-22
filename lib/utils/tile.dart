import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  final String flavor;
  final String price;
  final color;
  final String imageName;
  final VoidCallback likePressed;
  final VoidCallback addToCartPressed;
  final IconData icon;

  const Tile({
    Key? key,
    required this.flavor,
    required this.price,
    required this.color,
    required this.imageName,
    required this.likePressed,
    required this.addToCartPressed,
    required this.icon,
  }) : super(key: key);

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.color[50],
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
                    color: widget.color[100],
                  ),
                  child: Text(
                    '\$${widget.price}',
                    style: TextStyle(
                      color: widget.color[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
              child: Image.asset(widget.imageName),
            ),
            Text(
              widget.flavor,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Dunkins',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                      widget.likePressed();
                    },
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.pink[400] : Colors.grey[800],
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.addToCartPressed,
                    child: Icon(
                      widget.icon,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
