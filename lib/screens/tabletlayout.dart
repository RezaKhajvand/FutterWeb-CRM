import 'dart:ui';
import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'سلام کاربر عزیز',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
            fontVariations: [
              FontVariation('wght', 600),
              FontVariation('wdth', 100),
            ],
          ),
        ),
      ),
    );
  }
}
