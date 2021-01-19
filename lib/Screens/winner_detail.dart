import 'package:flutter/material.dart';

class WinnerDetailScreen extends StatelessWidget {
  final String name;
  WinnerDetailScreen(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Pemenang',
        ),
      ),
      body: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
