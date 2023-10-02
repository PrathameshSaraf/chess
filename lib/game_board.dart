import 'package:chess/Components/piece.dart';
import 'package:chess/Components/square.dart';
import 'package:chess/helper/helperMethods.dart';
import 'package:chess/values/colors.dart';
import 'package:flutter/material.dart';

class Gameboard extends StatefulWidget {
  const Gameboard({super.key});

  @override
  State<Gameboard> createState() => _GameboardState();
}

class _GameboardState extends State<Gameboard> {
  late List<List<ChessPiece?>> board;
  ChessPiece? selectedPiece;

  int selectedRow=-1;   // no piece row selected
  int selectedCol=-1;   //no col piece selected


  // A list valid moves for the currently selected piece
  List<List<int>> validMoves=[];

  void peiceSelected(int row ,int col){
      setState(() {
        if(board[row][col]!=null){
          selectedPiece=board[row][col];
          selectedCol=col;
          selectedRow=row;
        }

        // if a peice is selected, calculated its valid moves
        validMoves=calculateRowValidMoves(selectedRow,selectedCol,selectedPiece);
      });
  }


  //Calculate row valid moves
List<List<int>> calculateRowValidMoves(int row,int col,ChessPiece? piece){
    List<List<int>> candidateMoves=[];

    // different directions based on their color
    int direction=piece!.isWhite?-1:1;
    switch(piece.type){
      case ChessPieceType.bishop:   break;
      case ChessPieceType.pawn:
        // pawns can move forward if the square is not occupied
      if(isInBoard(row+direction,col) && board[row+direction][col]==null){
        candidateMoves.add([row+direction,col]);
      }

      //pawns can move two position if pawns initial position (starting postion move 2 square move forward)
      if((row == 1 && !piece.isWhite) || (row==6 && piece.isWhite)){
        if(isInBord(row+2,col))
      }



        break;

      case ChessPieceType.king:   break;
      case ChessPieceType.knight:   break;
      case ChessPieceType.queen:   break;
      case ChessPieceType.rook:   break;
      default:
    }
    return candidateMoves;
}



  //create a piece
  ChessPiece myPawn = ChessPiece(
      isWhite: false,
      type: ChessPieceType.pawn,
      imagePath: 'assets/black/pawn.png');

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    // initialize board is empty or null
    List<List<ChessPiece?>> newBoard =
        List.generate(8, (index) => List.generate(8, (index) => null));

    //Place pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(
          isWhite: false,
          type: ChessPieceType.pawn,
          imagePath: 'assets/black/pawn.png');
      newBoard[6][i] = ChessPiece(
          isWhite: true,
          type: ChessPieceType.pawn,
          imagePath: 'assets/black/pawn.png');
    }
    //Place rooks
    newBoard[0][0]=ChessPiece(isWhite: false, type:ChessPieceType.rook,
        imagePath:'assets/black/rook.png' );

    newBoard[0][7]=ChessPiece(isWhite: false, type:ChessPieceType.rook,
        imagePath:'assets/black/rook.png' );

    newBoard[7][0]=ChessPiece(isWhite: true, type:ChessPieceType.rook,
        imagePath:'assets/black/rook.png' );

    newBoard[7][7]=ChessPiece(isWhite: true, type:ChessPieceType.rook,
        imagePath:'assets/black/rook.png' );

    //Place knights
    newBoard[0][1]=ChessPiece(isWhite: false, type:ChessPieceType.rook,
        imagePath:'assets/black/knight.png' );

    newBoard[0][6]=ChessPiece(isWhite: false, type:ChessPieceType.rook,
        imagePath:'assets/black/knight.png' );

    newBoard[7][1]=ChessPiece(isWhite: true, type:ChessPieceType.rook,
        imagePath:'assets/black/knight.png' );

    newBoard[7][6]=ChessPiece(isWhite: true, type:ChessPieceType.rook,
        imagePath:'assets/black/knight.png' );

    //Place bishops
    newBoard[0][2]=ChessPiece(isWhite: false, type:ChessPieceType.rook,
        imagePath:'assets/black/bishop.png' );

    newBoard[0][5]=ChessPiece(isWhite: false, type:ChessPieceType.rook,
        imagePath:'assets/black/bishop.png' );

    newBoard[7][2]=ChessPiece(isWhite: true, type:ChessPieceType.rook,
        imagePath:'assets/black/bishop.png' );

    newBoard[7][5]=ChessPiece(isWhite: true, type:ChessPieceType.rook,
        imagePath:'assets/black/bishop.png' );
    //Place queens
    newBoard[0][4]=ChessPiece(isWhite: false, type:ChessPieceType.rook,
        imagePath:'assets/black/queen.png' );

    newBoard[7][3]=ChessPiece(isWhite: true, type:ChessPieceType.rook,
        imagePath:'assets/black/queen.png' );
    //Place Kings
    newBoard[0][3]=ChessPiece(isWhite: false, type:ChessPieceType.rook,
        imagePath:'assets/black/king.png' );

    newBoard[7][4]=ChessPiece(isWhite: true, type:ChessPieceType.rook,
        imagePath:'assets/black/king.png' );
    board=newBoard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: GridView.builder(
            itemCount: 8 * 8,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
            itemBuilder: (context, index) {
              int row = index ~/ 8;
              int col = index % 8;

              //check if this square is selected
              bool isSelected =selectedRow==row && selectedCol==col;

              return Square(
                  onTap: ()=>peiceSelected(row,col),
                  isWhite: isWhite(index), piece: board[row][col],isSelected: isSelected);
            }));
  }
}
