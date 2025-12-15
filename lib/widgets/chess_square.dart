import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_pawn/utils/get_square_color.dart';
import 'chess_piece.dart';

class ChessSquare extends StatelessWidget {
  final int row;
  final int col;
  final ChessPiece? piece;

  const ChessSquare({
    super.key,
    required this.row,
    required this.col,
    this.piece,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getSquareColor(row, col),
      child: piece != null ? SvgPicture.asset(piece!.getImagePath()) : null,
    );
  }
}
