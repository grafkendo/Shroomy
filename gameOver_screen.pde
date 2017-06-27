class gameOver_screen{


  public gameOver_screen(){
  
  
  };
  
  
  void update(){
  
  //move all game objects to HYPERSPACE mushrooms player ect
  
  for(Player_item item: inShrooms.shrooms ){
    //carefull ot to pick up null pointer error
   if (item != null){
             item._sprite.setX(HYPERSPACE);
       }
   
   }
  
  };


//is this overriding the main draw method? robly not.
void draw(){

PFont kirby;
  background( bgnight );
  fill( #cafb98, 150 );
  rect( 70, 90, 500, 110, 7 );
  kirby = createFont( "kirbyss.ttf",70 );
  textFont( kirby );
  fill( #ffffff, 255 );
  text( "Game Over !", width / 2, 130 );
  textSize( 18 );
  fill( #a52a2a, 200 );
  text( "-press A to try agian-", width / 2, 180 );
  textAlign( CENTER, CENTER );

}; //end draw




};// end gameover screen

  
  