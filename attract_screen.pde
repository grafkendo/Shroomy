class attract_screen{


public attract_screen(){


};

void draw(){

 PFont kirby;
  background( bg );
  fill( #cafb98, 150 );
  rect( 70, 90, 500, 110, 7 );
  kirby = createFont( "kirbyss.ttf", 100 );
  textFont( kirby );
  fill( #ffffff, 255 );
  text( "SHROOMY", width / 2, 130 );
  textSize( 32 );
  fill( #a52a2a, 200 );
  text( "-press A to start-", width / 2, 180 );
  textAlign( CENTER, CENTER );
  //fill(0,152,153,100);
  //TODO:  clear font ..... 


};



};