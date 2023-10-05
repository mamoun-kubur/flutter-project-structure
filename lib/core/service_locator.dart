import 'package:flutter_project_structure/screens/products/provider/products.dart';
import 'package:flutter_project_structure/screens/products/repositories/products.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.instance;

void setupServiceLocator() {
  // register the repository class as a factory so that a new instance is created every time
  locator.registerFactory<RemoteProductRepository>(() => RemoteProductRepository());
  // create the provider class as a singleton
  locator.registerSingleton(ProductsProvider(locator<RemoteProductRepository>()));

  // example of a provider that depends on another provider
  // locator.registerSingleton(CartProvider(locator<ProductsProvider>()));

  // register the logger as a singleton
  locator.registerSingleton(Logger(
     printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
  )
  ));
}
