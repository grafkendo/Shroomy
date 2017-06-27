class pause_screen{
//constructor
public pause_screen(){


};

public void draw(){
  
  PFont kirby;
  background( 0 );
  fill( #cafb98, 150 );
  rect( 20, 90, 600, 110, 7 );
  kirby = createFont( "kirbyss.ttf", 100 );
  textFont( kirby );
  fill( #ffffff, 255 );
  text( "PAUSED", width / 2, 130 );
  textSize( 32 );
  fill( #a52a2a, 200 );
  text( "Press -A- to resume", width / 2, 180 );
  textAlign( CENTER, CENTER );
  
  
  
  
};





};//end pause class