/// player issue branch trying to get the pplayer object encapsulated constructor and sprinte object passed in.
import sprites.*;
import sprites.maths.*;
import sprites.utils.*;
import java.util.*;
import ddf.minim.*;


// draw a sprite from documentation
/**
 * Bouncy Bubbles  
 * based on code from Keith Peters. 
 * 
 * Multiple-object collision.
 */
PImage img; //mushroom image Declare variable "a" of type PImage
PImage bg;
PImage bgnight;
//Game states
//  atract_start, playing, game_over, paused
// save as emum or an object

public enum GameState {
  ATRACT,
  PLAYING,
  IN_MENU,
  GAME_OVER,
  PAUSED;
  // Constructor
  private GameState() {
  
  };
  
};
// saparate draw functions for each game state
// variable for game states
GameState state = GameState.ATRACT;;

//player CONSTANTS
final float HYPERSPACE = -500;
final float PLYR_VEL = 100;
final int PLYR_STOPED = 0;
final int PLYR_LEFT = -1;
final int PLYR_RIGHT = +1;
final boolean PLYR_ADDWATER = false;
final boolean PLYR_ADDSEED = false;
// Current player state
int playerState = PLYR_STOPED;
StopWatch sw = new StopWatch();


//class declarations *********************************
 
Player player = new Player();

//int numshroom = 3;
 

//load create sprites
//Sprite greenShroom;
//Sprite redShroom;
//Sprite blueShroom;
Sprite monarch;

// initialize stuff
Debug_hud hud = new Debug_hud();
pause_screen pauseScreen = new pause_screen();
gameOver_screen gameOver = new gameOver_screen();
playing_screen playing = new playing_screen();
attract_screen attract = new attract_screen();
inventory inventory = new inventory(); 
input_manager input = new input_manager();


//physics
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;


public void pre() {
    // Calculate time difference since last call
    float elapsedTime = ( float ) sw.getElapsedTime();
    S4P.updateSprites( elapsedTime );
  }

//// player basic Controlls*******************************************************************************************
public void keyEvent( KeyEvent e ) { //TODO add logic for inputs eg. procControll(key,gamestate,playerstate);
  
    input.process_input();
    
     
  }
   

public void initMonarch() {
  monarch = new Sprite( this, "butterfly_sprite2.png", 10, 4, 0, true );
  //TODO: adjust monarch frame sequence for left and right flying.
  monarch.setFrameSequence( 10, 20, 0.05f );
  monarch.setDomain( 5, 5, width, height, Sprite.REBOUND );
  monarch.setVelX( 100 );
  monarch.setVelY( 50 );
};


public void initPlayer() {
  // note sprites can only be created in setup becaue of image load
  player = new Player();
  player._Sprite = new Sprite( this, "brown_farmer2.png", 7, 4, 0, true );
  player._Sprite.setDomain( 5, 360, width + 10, height, Sprite.REBOUND );
  player._Sprite.setXY( width / 2, 275 );
  print( "Console: " + "player initialized ! " + "\n" );
};

 
 add_shrooms inShrooms;
 

void setup() { // set up runs once
    size( 640, 360 );
    //fullScreen(P2D);
    inShrooms = new add_shrooms();
    
// The image file must be in the data folder of the current sketch 
// to load successfully images only load in setup
    img = loadImage( "RetroMushroom.png" );
    bg = loadImage( "bg_day640x360.png" );
    bgnight = loadImage("BG_sunset640x360.png");
    
//initialize 
    initMonarch();
    initPlayer();
    registerMethod( "pre", this );
    registerMethod( "keyEvent", this );
  } // end set up
  
public void draw() {
    // switch to draw method per gamestate 
    switch ( state ) {
      case ATRACT:
        attract.draw();//drawAtract();
        break;
      case PLAYING:
        playing.draw(); //drawPlaying();
        break;
      case GAME_OVER:
        gameOver.draw();//drawGameOver();
        break;
      case PAUSED:
        pauseScreen.draw();//drawPaused();
        break;       
default: attract.draw();
    }; // end switch
 
    S4P.drawSprites();
   
  } //end draw