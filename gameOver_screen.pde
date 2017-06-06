class gameOver_screen{


  public gameOver_screen(){
  
  
  };



void draw(){

PFont kirby;
  background( bg );
  fill( #cafb98, 150 );
  rect( 70, 90, 500, 110, 7 );
  kirby = createFont( "kirbyss.ttf", 100 );
  textFont( kirby );
  fill( #ffffff, 255 );
  text( "Game Over !", width / 2, 130 );
  textSize( 18 );
  fill( #a52a2a, 200 );
  text( "-press A to try agian-", width / 2, 180 );
  textAlign( CENTER, CENTER );

};




};// end gameover screen

  
  