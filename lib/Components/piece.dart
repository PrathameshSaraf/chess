enum ChessPieceType {pawn, rook, knight,bishop,queen,king}

class ChessPiece{
  final ChessPieceType type;
  final bool isWhite;
  final String imagePath;

  ChessPiece({
   required this.isWhite,required this.type, required this.imagePath
});
}