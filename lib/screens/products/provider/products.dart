import 'package:flutter/material.dart';
import 'package:flutter_project_structure/models/error_object.dart';
import 'package:flutter_project_structure/screens/products/models/product.dart';
import 'package:flutter_project_structure/screens/products/repositories/products.dart';

class ProductsProvider extends ChangeNotifier {
  late IProductRepository _productRepository;
  ProductsProvider(this._productRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ErrorObject? _error;
  ErrorObject? get error => _error;

  Product? _product;
  Product? get product => _product;

  Future<void> getProduct() async {
    _isLoading = true;
    // this to remove markNeedsBuild() error during build
    Future.delayed(Duration.zero, notifyListeners);

    final result = await _productRepository.getProduct();
    _error = result.error;
    if (_error != null) {
      _isLoading = false;
      notifyListeners();
      return;
    }

    _product = result.product;

    _isLoading = false;
    Future.delayed(Duration.zero, notifyListeners);
  }
}
