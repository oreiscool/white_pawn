import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_pawn/utils/get_square_color.dart';
import 'chess_piece.dart';

class ChessSquare extends StatelessWidget {
  final int row;
  final int col;
  final ChessPiece? piece;
  final bool isSelected;

  const ChessSquare({
    super.key,
    required this.row,
    required this.col,
    required this.piece,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? Colors.yellow : getSquareColor(row, col),
      child: piece != null ? SvgPicture.asset(piece!.getImagePath()) : null,
    );
  }
}
