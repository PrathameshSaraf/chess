bool isWhite(int index){
  int x=index~/8;  //this gives us integer division i.e row
  int y=index%8;  // this gives us he remainder i.e  colunm
  bool iswhite=(x+y)%2==0;

  return iswhite;
}

bool isInBoard(int row, int col){
  return row>=0 && row <8 && col >=0 && col<8;
}