import 'package:flutter/material.dart';
import 'package:simple_chess_board/simple_chess_board.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  @override
  Widget build(BuildContext context) {
    return SimpleChessBoard(
      engineThinking: false,
      fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
      whitePlayerType: PlayerType.human,
      blackPlayerType: PlayerType.computer,
      onMove: ({required move}) => debugPrint('Move made: $move'),
      onPromote: () async => PieceType.queen,
      onPromotionCommited: ({required moveDone, required pieceType}) =>
          debugPrint('Promotion done: $moveDone to $pieceType'),
      onTap: ({required cellCoordinate}) =>
          debugPrint('Cell tapped: $cellCoordinate'),
      chessBoardColors: ChessBoardColors()
        ..lightSquaresColor = Colors.white
        ..darkSquaresColor = Colors.grey,
      cellHighlights: const {},
    );
  }
}
