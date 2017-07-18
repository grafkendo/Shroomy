class collision_handler{

public void collision_handler(){


};

// should add a way to subcribe game actors to the collision handler

// should pass in player and shroom to break tight cupling badn practice
public void processCollisions() {
  // / iterate through all objects on screen proc if hit on player
  for ( Player_item p:gameActors) {
    if (p != null){
    if ( p._sprite.oo_collision( player._Sprite, 3 ) ) {
      print( "CH Hit!" );
      PFont kirby;
      kirby = createFont( "kirbyss.ttf", 32 );
      textFont( kirby );
      textSize( 25 );
      text( " Press A \n to Pick up ", width / 2, height / 2 - 50 );
      textAlign( CENTER, CENTER );
      //fill(0,102,153,100);
      
    // we need to get the item player is coliding with and give prompt to pickup if( key is pressed ){inventory add;}
 
    
     // inventory.addPlayer_item( inShrooms.shrooms[ i ] );
     inventory.add(p);
    }
    }; // end if
  }; //end loop
}; // end proc collisions




};