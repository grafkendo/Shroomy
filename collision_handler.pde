class collision_handler{

public void collision_handler(){


};

public void processCollisions() {
  // / iterate through all objects on screen proc if hit on player
  for ( int i = 0; i < shrooms.length; i++ ) {
    if ( shrooms[ i ]._sprite.oo_collision( player._Sprite, 3 ) ) {
      print( "Hit!" );
      PFont kirby;
      kirby = createFont( "kirbyss.ttf", 32 );
      textFont( kirby );
      textSize( 25 );
      text( " Press A \n to Pick up ", width / 2, height / 2 - 50 );
      textAlign( CENTER, CENTER );
      //fill(0,102,153,100);
      inventory.addPlayer_item( shrooms[ i ] );
      shrooms[i]._sprite.setXY(55,55);
      shrooms[ i ]._sprite.setVelXY( 0, 0 );
      //shrooms[0].setDead(true);
    }; // end if
  }; //end loop
}; // end proc collisions




};