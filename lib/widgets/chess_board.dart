import 'package:flutter/material.dart';
import 'chess_square.dart';
import 'chess_piece.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  int? selectedRow;
  int? selectedCol;

  late List<List<ChessPiece?>> board = List.generate(
    8,
    (index) => List.generate(8, (index) => null),
  );

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    for (int col = 0; col < 8; col++) {
      board[6][col] = ChessPiece(type: ChessPieceType.pawn, isWhite: false);
      board[1][col] = ChessPiece(type: ChessPieceType.pawn, isWhite: true);
    }

    final pieceOrder = [
      ChessPieceType.rook,
      ChessPieceType.knight,
      ChessPieceType.bishop,
      ChessPieceType.queen,
      ChessPieceType.king,
      ChessPieceType.bishop,
      ChessPieceType.knight,
      ChessPieceType.rook,
    ];

    for (int col = 0; col < 8; col++) {
      board[0][col] = ChessPiece(type: pieceOrder[col], isWhite: true);
      board[7][col] = ChessPiece(type: pieceOrder[col], isWhite: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 64,
        itemBuilder: (context, index) {
          final int row = index ~/ 8;
          final int col = index % 8;
          return GestureDetector(
            onTap: () => setState(() {
              if (selectedRow == row && selectedCol == col) {
                selectedRow = null;
                selectedCol = null;
              } else if (selectedRow != null && selectedCol != null) {
                final piece = board[selectedRow!][selectedCol!];
                board[selectedRow!][selectedCol!] = null;
                board[row][col] = piece;
                selectedRow = null;
                selectedCol = null;
              } else {
                selectedRow = row;
                selectedCol = col;
              }
            }),
            child: ChessSquare(
              row: row,
              col: col,
              piece: board[row][col],
              isSelected: selectedRow == row && selectedCol == col,
            ),
          );
        },
      ),
    );
  }
}
