import 'package:flutter/material.dart';

class CustomErrorMessage extends StatelessWidget {
  final String message;
  const CustomErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Icon(
            Icons.error_outline,
            size: 40,
          ),
          Text(
            message,
            style: const TextStyle(
              fontSize: 20,
          ))
        ],
      ),
    );
  }
}