import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String iconPath;
  const MyTab({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Tab(
        height: 80,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            iconPath,
            color: Colors.grey[600],
            errorBuilder: (_, __, ___) {
              return const Icon(
                Icons.error,
                color: Colors.grey,
              );
            },
          ),
        ),
      ),
    );
  }
}
