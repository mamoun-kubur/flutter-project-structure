import 'package:flutter/material.dart';
import 'package:flutter_project_structure/screens/products/provider/products.dart';
import 'package:flutter_project_structure/widgets/error_message.dart';
import 'package:flutter_project_structure/widgets/progress_indicator.dart';
import 'package:provider/provider.dart';

import 'widgets/product_widget.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = '/products';
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    Provider.of<ProductsProvider>(context, listen: false).getProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Consumer<ProductsProvider>(
        builder: (context, productProvider, child) {

          if (productProvider.isLoading) {
            return const CustomProgressIndicator();
          }

          if (productProvider.error != null) {
            return CustomErrorMessage(message: productProvider.error!.msg);
          }

          return ProductWidget(product: productProvider.product!);
        }
    ));
  }
}