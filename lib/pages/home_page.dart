import 'package:flutter/material.dart';
import 'package:white_pawn/pages/chess_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChessPage()),
            );
          },
          child: const Text('Play'),
        ),
      ),
    );
  }
}
