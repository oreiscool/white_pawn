import 'package:flutter/material.dart';
import 'chess_sqaure.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
          childAspectRatio: 1,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 64,
        itemBuilder: (context, index) {
          final int row = index ~/ 8;
          final int col = index % 8;
          return ChessSquare(row: row, col: col);
        },
      ),
    );
  }
}
