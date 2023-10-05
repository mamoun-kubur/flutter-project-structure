import 'package:flutter/material.dart';
import 'package:flutter_project_structure/screens/products/models/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(product.name)),
    );
  }
}