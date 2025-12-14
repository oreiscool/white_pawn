import 'package:flutter/material.dart';
import 'package:white_pawn/utils/get_square_color.dart';

class ChessSquare extends StatelessWidget {
  final int row;
  final int col;

  const ChessSquare({super.key, required this.row, required this.col});

  @override
  Widget build(BuildContext context) {
    return Container(color: getSquareColor(row, col));
  }
}
