
import 'package:flutter_project_structure/main.dart';
import 'package:flutter_project_structure/screens/products/products_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: 'Hello Flutter',),
    ),
    GoRoute(
      path: ProductScreen.routeName,
      builder: (context, state) => const ProductScreen(),
    ),
  ],
);