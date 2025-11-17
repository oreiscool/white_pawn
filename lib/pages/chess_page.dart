import 'package:flutter/material.dart';
import 'package:white_pawn/widgets/chess_board.dart';

class ChessPage extends StatefulWidget {
  const ChessPage({super.key});

  @override
  State<ChessPage> createState() => _ChessPageState();
}

class _ChessPageState extends State<ChessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: ChessBoard()));
  }
}
