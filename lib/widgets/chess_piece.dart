enum ChessPieceType { pawn, rook, knight, bishop, queen, king }

class ChessPiece {
  final ChessPieceType type;
  final bool isWhite;

  ChessPiece({required this.type, required this.isWhite});

  String getImagePath() {
    final color = isWhite ? 'w' : 'b';
    final pieceType = type.toString().split('.').last;
    return 'assets/chess_pieces/$pieceType-$color.svg';
  }
}
