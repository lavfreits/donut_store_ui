import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('products').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData) {
                  final products = snapshot.data!.docs;
                  if (products.isEmpty) {
                    return const Center(child: Text('No products available'));
                  }

                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final productData =
                          product.data() as Map<String, dynamic>;
                      return ListTile(
                        leading: Image.asset(productData['image']),
                        title: Text(productData['name']),
                        subtitle: Text('\$${productData['price']}'),
                      );
                    },
                  );
                }
                return const Center(child: Text('No products available'));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                ),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _imageController,
                  decoration: const InputDecoration(labelText: 'Image Path'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addProduct,
                  child: const Text('Add Product'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addProduct() {
    final name = _nameController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;
    final image = _imageController.text;
    final id = const Uuid().v4();

    _firestore.collection('products').doc(id).set({
      'id': id,
      'name': name,
      'price': price,
      'image': image,
    });

    _nameController.clear();
    _priceController.clear();
    _imageController.clear();
  }
}
