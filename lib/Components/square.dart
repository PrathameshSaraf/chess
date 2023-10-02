import 'package:chess/Components/piece.dart';
import 'package:chess/values/colors.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final void Function()? onTap;

  const Square({super.key,required this.isWhite,required this.piece,required this.isSelected,required this.onTap});

  @override
  Widget build(BuildContext context) {
  Color? SquareColor;
    // if selected color is green
      if(isSelected){
        SquareColor=Colors.green;
      }
    // else color is whilt
      else{
        SquareColor= isWhite?foreground:background;
      }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: SquareColor,
        child: piece!=null?Image.asset(piece!.imagePath,color: piece!.isWhite?Colors.white:Colors.black,):null,
      ),
    );
  }
}
