import 'package:flutter/material.dart';
import 'package:chess/chess.dart'
    as chess; // Has to be imported as 'chess' to avoid name conflicts
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
  late chess.Chess gameChess;
  late List<List<ChessPiece?>> board = List.generate(
    8,
    (index) => List.generate(8, (index) => null),
  );

  @override
  void initState() {
    super.initState();
    gameChess = chess.Chess();
    _initializeBoard();
  }

  // Initializes the board with pieces in starting positions
  void _initializeBoard() {
    for (int col = 0; col < 8; col++) {
      board[1][col] = ChessPiece(type: ChessPieceType.pawn, isWhite: false);
      board[6][col] = ChessPiece(type: ChessPieceType.pawn, isWhite: true);
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
      board[0][col] = ChessPiece(type: pieceOrder[col], isWhite: false);
      board[7][col] = ChessPiece(type: pieceOrder[col], isWhite: true);
    }
  }

  // Syncs the internal board representation with the game state
  void _syncBoardWithGame() {
    for (int r = 0; r < 8; r++) {
      for (int c = 0; c < 8; c++) {
        String square = _rowColToNotation(r, c);
        var piece = gameChess.get(square);
        if (piece == null) {
          board[r][c] = null;
        } else {
          ChessPieceType type;
          switch (piece.type) {
            case chess.Chess.PAWN:
              type = ChessPieceType.pawn;
              break;
            case chess.Chess.ROOK:
              type = ChessPieceType.rook;
              break;
            case chess.Chess.KNIGHT:
              type = ChessPieceType.knight;
              break;
            case chess.Chess.BISHOP:
              type = ChessPieceType.bishop;
              break;
            case chess.Chess.QUEEN:
              type = ChessPieceType.queen;
              break;
            case chess.Chess.KING:
              type = ChessPieceType.king;
              break;
            default:
              type = ChessPieceType.pawn;
          }
          board[r][c] = ChessPiece(
            type: type,
            isWhite: piece.color == chess.Chess.WHITE,
          );
        }
      }
    }
  }

  // Helper to convert row/col to algebraic chess notation
  String _rowColToNotation(int row, int col) {
    final files = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
    final rank = (8 - row).toString();
    final file = files[col];
    return '$file$rank';
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> legalMoves = gameChess.generate_moves();

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
              if (selectedRow == null) {
                selectedRow = row;
                selectedCol = col;
              } else if (selectedRow == row && selectedCol == col) {
                selectedRow = null;
                selectedCol = null;
              } else {
                String fromSquare = _rowColToNotation(
                  selectedRow!,
                  selectedCol!,
                );
                String toSquare = _rowColToNotation(row, col);
                selectedRow = row;
                selectedCol = col;

                dynamic moveToMake;
                try {
                  moveToMake = legalMoves.firstWhere((move) {
                    return move.fromAlgebraic == fromSquare &&
                        move.toAlgebraic == toSquare;
                  });
                } catch (e) {
                  moveToMake = null;
                }

                if (moveToMake != null) {
                  gameChess.make_move(moveToMake);
                  _syncBoardWithGame();
                  selectedRow = null;
                  selectedCol = null;
                }
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
