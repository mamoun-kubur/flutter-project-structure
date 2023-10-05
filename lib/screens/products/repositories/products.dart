// Define the interface for the product repository
import 'dart:math';

import 'package:flutter_project_structure/core/service_locator.dart';
import 'package:flutter_project_structure/models/error_object.dart';
import 'package:flutter_project_structure/screens/products/models/product.dart';
import 'package:logger/logger.dart';

abstract class IProductRepository {
  Future<({ErrorObject? error,Product? product})> getProduct();
}

// Create the first implementation for retrieving products from the server
class RemoteProductRepository implements IProductRepository {
  @override
  Future<({ErrorObject? error,Product? product})> getProduct() async {
    try {
    // Implement the logic to fetch products from the server

    // simulate the delay of fetching data from the server
    Future.delayed(const Duration(seconds: 2), () {});
    locator.get<Logger>().d('fetching data from the server');
    return (error: null,product: Product(name: 'cake ${Random().nextInt(100)}'));
    } catch (e) {
      // you can check the type of error and return the appropriate error
      locator.get<Logger>().e(e);
      return (error: ErrorObject.networkError,product: null);
    }
  }
}

// Create the second implementation for retrieving products from Hive
class LocalProductRepository implements IProductRepository {
  @override
  Future<({ErrorObject? error,Product? product})> getProduct() async {
    // Implement the logic to fetch products from Hive
    // ...
    try {
      return (error: null,product: Product(name: 'cake'));
    } catch (e) {
      return (error: ErrorObject.unknownError,product: null);
    }
  }
}