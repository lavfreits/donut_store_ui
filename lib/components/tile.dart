import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tile_controller.dart';

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
  late TileController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(TileController(), tag: widget.flavor);
  }

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
                  padding: const EdgeInsets.all(8),
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
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Image.asset(
                widget.imageName,
                height: 85,
              ),
            ),
            Text(
              widget.flavor,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.toggleLike();
                      widget.likePressed();
                    },
                    child: Obx(
                      () => Icon(
                        controller.isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: controller.isLiked
                            ? Colors.pink[400]
                            : Colors.grey[800],
                      ),
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
