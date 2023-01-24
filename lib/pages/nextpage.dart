import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(date.toString())),
    );
  }
}
