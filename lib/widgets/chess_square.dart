import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_pawn/utils/get_square_color.dart';
import 'chess_piece.dart';

class ChessSquare extends StatelessWidget {
  final int row;
  final int col;
  final ChessPiece? piece;
  final bool isSelected;
  final bool isValidDestination;
  final bool isKingInCheck;

  const ChessSquare({
    super.key,
    required this.row,
    required this.col,
    required this.piece,
    required this.isSelected,
    required this.isValidDestination,
    required this.isKingInCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isKingInCheck
          ? Colors.redAccent
          : (isSelected ? Colors.yellow : getSquareColor(row, col)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (piece != null)
            SizedBox.expand(child: SvgPicture.asset(piece!.getImagePath())),
          if (isValidDestination)
            if (piece != null)
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54.withAlpha(150),
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
              )
            else
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.black54.withAlpha(150),
                  shape: BoxShape.circle,
                ),
              ),
        ],
      ),
    );
  }
}
