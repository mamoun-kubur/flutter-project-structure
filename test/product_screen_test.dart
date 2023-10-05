// we can create a mock class using Mocktail package
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/models/error_object.dart';
import 'package:flutter_project_structure/screens/products/models/product.dart';
import 'package:flutter_project_structure/screens/products/products_screen.dart';
import 'package:flutter_project_structure/screens/products/provider/products.dart';
import 'package:flutter_project_structure/screens/products/repositories/products.dart';
import 'package:flutter_project_structure/screens/products/widgets/product_widget.dart';
import 'package:flutter_project_structure/widgets/error_message.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class ProductRepositoryMock extends Mock implements IProductRepository {}

Future<void> main() async{
  late ProductRepositoryMock productRepositoryMock;
  // we will us this productRepositoryMock accross all tests
  // that why we defined it in setUpAll method
  setUpAll((){
    productRepositoryMock = ProductRepositoryMock();
  });

  testWidgets('Arrange ProductScreen page, Act init, Assert ProductWidget is displayed When data retrieved successfully', (WidgetTester tester) async {
    // here we set the repo to return the data we need for testing
    when(()=>productRepositoryMock.getProduct())
    .thenAnswer((_) async => Future.value((error: null,product: Product(name:'cake'))));
    // here we setup the widget we what to test
    // notice how we injected our mock repo class to the provider
    // note: pumpWidget() Renders the UI from the given widget
    await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider(
            create: (context) => ProductsProvider(productRepositoryMock),
            child: const ProductScreen())));
    // Repeatedly calls the pump() method with duration until there is no frame to schedule
    await tester.pumpAndSettle();
    
    // assert to find this widget 
    expect(find.byType(ProductWidget), findsOneWidget);
  });

  testWidgets('Arrange ProductScreen page, Act init, Assert ErrorObject is displayed When data retrieving failed', (WidgetTester tester) async {

    when(()=>productRepositoryMock.getProduct())
    .thenAnswer((_) async => Future.value((error: ErrorObject.networkError, product: null)));
   
    await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider(
            create: (context) => ProductsProvider(productRepositoryMock),
            child: const ProductScreen())));
    await tester.pumpAndSettle();

    expect(find.byType(ProductWidget), findsNothing);
    expect(find.byType(CustomErrorMessage), findsOneWidget);
  });
}