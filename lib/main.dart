import 'package:flutter/material.dart';
import 'package:flutter_project_structure/core/service_locator.dart';
import 'package:flutter_project_structure/router/router.dart';
import 'package:flutter_project_structure/screens/products/products_screen.dart';
import 'package:flutter_project_structure/screens/products/provider/products.dart';
import 'package:provider/provider.dart';

void main() async {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<ProductsProvider>()),
      ],
      child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
        )
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body:  Center(child: MaterialButton(
      onPressed: (){
        router.push(ProductScreen.routeName);
      },
      child: const Text('Go to Products'),
      )),
    );
  }
}
