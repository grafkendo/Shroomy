class input_manager{

  public void input_manager(){
  
  
  
  
  }
// pas in gamesate and playerstate inerface?
public void  process_input(){


if ( key == CODED ) {
      switch ( keyCode ) {
        case UP:
          player.setVelX( 0 );
          playerState = PLYR_STOPED;
          player._Sprite.setFrameSequence( 14, 16, 0.2f );
          break;
        case LEFT:
          player.setVelX( PLYR_LEFT * PLYR_VEL );
          playerState = PLYR_LEFT;
          player._Sprite.setFrameSequence( 0, 2, 0.1f );
          break;
        case RIGHT:
          player.setVelX( PLYR_RIGHT * PLYR_VEL );
          playerState = PLYR_RIGHT;
          player._Sprite.setFrameSequence( 3, 5, 0.1f );
          break;
        case DOWN:
          player.setVelX( 0 );
          playerState = PLYR_STOPED;
          player._Sprite.setFrameSequence( 12, 13, 0.3f );
          break;
      } // end switch controlls
    } else // debug controlls for manualy switching states
      switch ( key ) {
      case 'x':
        state = GameState.GAME_OVER;
        break;
      case 'a': //action button
        state = GameState.PLAYING;
        break;
      case 'q': //quit 
        state = GameState.ATRACT;
        break;
      case 'p': //paused
        state = GameState.PAUSED;
        break;
      case 'd'://drop item(selected)  
                    inventory.remove();
    }


};


};