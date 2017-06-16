class collision_handler{

public void collision_handler(){


};

public void processCollisions() {
  // / iterate through all objects on screen proc if hit on player
  for ( int i = 0; i < inShrooms.shrooms.length; i++ ) {
    if ( inShrooms.shrooms[ i ]._sprite.oo_collision( player._Sprite, 3 ) ) {
      print( "Hit!" );
      PFont kirby;
      kirby = createFont( "kirbyss.ttf", 32 );
      textFont( kirby );
      textSize( 25 );
      text( " Press A \n to Pick up ", width / 2, height / 2 - 50 );
      textAlign( CENTER, CENTER );
      //fill(0,102,153,100);
      
     // here the inventory is hard coded to pick up the first item of shrrooms
    // we need to get the item player is coliding with and give prompt to pickup
    
      inventory.addPlayer_item( inShrooms.shrooms[ i ] );
     
    }; // end if
  }; //end loop
}; // end proc collisions




};