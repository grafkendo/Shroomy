import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import sprites.*; 
import sprites.maths.*; 
import sprites.utils.*; 
import java.util.*; 
import ddf.minim.*; 
import java.util.LinkedList; 
import sprites.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Shroomy extends PApplet {

/// player issue branch trying to get the pplayer object encapsulated constructor and sprinte object passed in.







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
float spring = 0.05f;
float gravity = 0.03f;
float friction = -0.9f;


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
 

public void setup() { // set up runs once
    
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
        gameOver.update();
        gameOver.draw();//drawGameOver();
        break;
      case PAUSED:
        pauseScreen.draw();//drawPaused();
        break;       
default: attract.draw();
    }; // end switch
 
    S4P.drawSprites();
   
  } //end draw
class Debug_hud{



public void draw(){
 int left_margin =5;
 int inventoryLine =120;
  int output = inShrooms.shrooms.length;
  
  
  
  //double shrm_1pos = Math.round(inShrooms.shrooms[0]._sprite.getX());
 // double shrm_2pos = Math.round(inShrooms.shrooms[1]._sprite.getX());
 // double shrm_3pos = Math.round(inShrooms.shrooms[2]._sprite.getX());
  //double plyr_pos =  Math.round(player.getX());
  

  textSize(25);
  
  //text("shroomy sees " + output + " mushrooms onscreen",10,30);
  //fill(20,102,153,100);
  
  textSize(10);
  //text("shrm 1 pos " + shrm_1pos ,10,50);
  fill(left_margin,152,153,100);
  
  textSize(10);
 // text("shrm 2 pos " + shrm_2pos ,10,70);
  fill(left_margin,152,153,100);
  
  textSize(10);
 // text("shrm 3 pos " + shrm_3pos ,10,90);
  fill(left_margin,152,153,100);
  
  textSize(10);
 //text("Player position " + plyr_pos ,10,110);
  fill(left_margin,152,153,100);
  for(Player_item p: inventory.tools){
    if(p != null){
 text("Player TOOLS: " + p._name,50,inventoryLine);
 
 inventoryLine += 10;
    }
  }
  
  for(Player_item p: inShrooms.shrooms){
    if(p != null){
 text("Game items: " + p._name,500,inventoryLine);
 
 inventoryLine += 10;
    }
  }
  

  
};

};



public class inventory {
  // inventory slot positions this class is for the palyer inventor not the world inventory

  int slotA = 55;
  private Player_item[] tools = new Player_item[6];
   
  int open_position  = 0;
  int tool_count =0;
  int tool_label_pos = 0;
  
  
  //// this is for the players inventory
  //constructor
  public inventory() {
 print( "Console: " + "inventory initialized ! " );

 
  };

 
  
  //pickup add item to inventory.tools
  public void addPlayer_item(Player_item item) {
   // copy item from world inventory to player inventory(tools)
   // pop item of its array or null it
   //move the sprite
    item._sprite.setVelXY( 0, 0 );
    open_position += 55;
    
    item._sprite.setXY(open_position,55);
    tools[tool_count] = item;
    // find the index of item in old array then null it
     int ndex = java.util.Arrays.asList(inShrooms.shrooms).indexOf(item);
     inShrooms.shrooms[ndex] = null;
    tool_count +=1;
    tool_label_pos += 55;
    
  }; // end add item
  
  
  public void setSelected(){
  // set selevted variable to the index within tools enventory
  
  }

  //drop
  public void removePlayer_item(Player_item item) {
  // move item to position of player
  open_position -= 55;
  tool_label_pos -= 55;
  if(item != null){
        item._sprite.setXY(player.getX()+100,player.getY()-30);
  // move item from tools array to shrooms(world inventory)
  
  inShrooms.shrooms[1] = item;
  
  int ndex = java.util.Arrays.asList(inventory.tools).indexOf(item);
  inventory.tools[ndex] =null;
  tool_count -= 1;
  //clean up nulls
  for (int j=0; j<inventory.tools.length; j++){
            if (inventory.tools[j]==null){
                for (int k=j+1; k<inventory.tools.length; k++){
                    inventory.tools[k-1] = inventory.tools[k];
                }
                inventory.tools[inventory.tools.length-1] = null;
                break;
            }
        }

  }
  }; // end remove item
  
  
  public void drawInventory() { 
    int position =55;
    // draw the grid boxes
    //main box
    line(30, 30, 600, 30);
    stroke(255);
    line(600, 30, 600, 80);
    stroke(255);
    line(600, 80, 30, 80);
    stroke(255);
    line(30, 80, 30, 30);
    
    // draw Player_item lables
    
    textSize(8);
    fill(255, 255, 255);
for(Player_item p: inventory.tools){
  if(p != null)
 text(p._name,position,75);
  
 position += 55;
  }
    // dividers
    line(80, 35, 80, 75);
    line(135, 35, 135, 75);
    line(190, 35, 190, 75);
  };
};




public class Player {
  //private instance variables
  private Sprite _Sprite;
  //public variables

  // constructors
    public void player() {

  //_Sprite = s;
  _Sprite.setDomain( 5, 360, width + 10, height, Sprite.REBOUND );
  _Sprite.setXY( width / 2, 275 );
  print( "Console: " + "player initialized ! " );

  } // end constructor
  // methods

  public void initilize() {
  
    this._Sprite.setDomain(5, 5, width - 5, height - 5, Sprite.REBOUND);
    this._Sprite.setXY(width / 2, 275);
  };
  
  public void setVelX(float vx) {
    _Sprite.setVelX(vx);
  };
  public int getX() {
    return (int)(_Sprite.getX());
  };
  public int getY() {
    return (int)(_Sprite.getY());
  };
  
  public void processCollisions() {
    if (player._Sprite.oo_collision(inShrooms.shrooms[0]._sprite, 3)) {
      print("Hit!");
      textSize(25);
      text("HIT!", width / 2, height / 2);
      fill(20, 102, 153, 100);
      inventory.addPlayer_item(inShrooms.shrooms[0]);
    };
  };
  public Sprite getSprite() {
    return _Sprite;
  };
}; // end class


 public class Player_item {
  //private instance variables

  // referance to sprite associated wi th this object
   Sprite _sprite;
    //public variables
    boolean _selected;
    String _name = " dust";
    String _type;
    int _weight;
    int _quality;
    String _effect;
   
    float xPos;
    float yPos;
    

  // constructors
   public  Player_item(String n,String t) //<>//
   {
     
    _name = n;
    _type = t;
    _weight = 1;
    _quality = 1;
    _selected = false;
    print(" player item contsructor called  \n ");
   }// end constructor
   
   
     
   
   public void useItem(Player_item target){
     
   
   };
   
};//end class
/* this should be called somethig else like shroom bank the class create s some dummy playeritems and returns  an array for use itn te main program
contains method to get the shroom and constructor maybe a funciton to register new game items  shroom manager
this should be addign shrooms to the game world not to the player inventory
*/
 
 public class add_shrooms{
 
 //proberties
 int count = 0;
 Player_item red;
 Player_item blue;
 Player_item green;
 Player_item[] shrooms;
 
 
 
 
 public add_shrooms(){
 
 shrooms = new Player_item[3];
 red = new Player_item("alvin","common");
 
 blue = new Player_item("simon","common");
  
 green = new Player_item("teddy","common");
 
 
 
 // eventually a loop will eliminat e this duplicat ecode
 
 red._sprite = new Sprite(Shroomy.this,"RetroMushroom.png",1,1,0);
   red._sprite.setDomain( 1, 1, width, height, Sprite.REBOUND );
     red._sprite.setScale( 0.1f );
       red._sprite.setVelX( 0 );
       red._sprite.setY(300.2f);
          red._sprite.setX(150.2f);
 
 blue._sprite = new Sprite (Shroomy.this,"RetroMushroom2.png",1,1,0);
   blue._sprite.setDomain( 1, 1, width, height, Sprite.REBOUND );
     blue._sprite.setScale( 0.1f );
       blue._sprite.setVelX( 0 );
         blue._sprite.setY(300.2f);
            blue._sprite.setX(100.2f);
 
 green._sprite = new Sprite (Shroomy.this,"RetroMushroom3.png",1,1,0);
   green._sprite.setDomain( 1, 1, width, height, Sprite.REBOUND );
     green._sprite.setScale( 0.1f );
       green._sprite.setVelX( 0 );
         green._sprite.setY(300.2f);
            green._sprite.setX(10.2f);

 
  shrooms[0]= red;
  shrooms[1]= blue;
  shrooms[2]= green;
  
  
 }
 
 
 
 
 public Player_item[] getshrooms()
 {
 
  return shrooms;
 
 }
 
 
 }
class attract_screen{


public attract_screen(){


};

public void draw(){

 PFont kirby;
  background( bg );
  fill( 0xffcafb98, 150 );
  rect( 70, 90, 500, 110, 7 );
  kirby = createFont( "kirbyss.ttf", 100 );
  textFont( kirby );
  fill( 0xffffffff, 255 );
  text( "SHROOMY", width / 2, 130 );
  textSize( 32 );
  fill( 0xffa52a2a, 200 );
  text( "-press A to start-", width / 2, 180 );
  textAlign( CENTER, CENTER );
  //fill(0,152,153,100);
  //TODO:  clear font ..... 


};



};
class collision_handler{

public void collision_handler(){


};
// should pass in player and shroom to break tight cupling badn practice
public void processCollisions() {
  // / iterate through all objects on screen proc if hit on player
  for ( int i = 0; i < inShrooms.shrooms.length; i++ ) {
    if (inShrooms.shrooms[i] != null){
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
    }
    }; // end if
  }; //end loop
}; // end proc collisions




};
class gameOver_screen{


  public gameOver_screen(){
  
  
  };
  
  
  public void update(){
  
  //move all game objects to HYPERSPACE mushrooms player ect
  
  for(Player_item item: inShrooms.shrooms ){
    //carefull ot to pick up null pointer error
   if (item != null){
             item._sprite.setX(HYPERSPACE);
       }
   
   }
   //  once game is loaded rest only moves sprites off screen
   for(Player_item item: inventory.tools ){
    //carefull ot to pick up null pointer error
   if (item != null){
             item._sprite.setX(HYPERSPACE);
       }
   
   }
   
   
  player._Sprite.setVelXY( 0, 0 );
  };


//is this overriding the main draw method? robly not.
public void draw(){

PFont kirby;
  background( bgnight );
  fill( 0xffcafb98, 150 );
  rect( 70, 90, 500, 110, 7 );
  kirby = createFont( "kirbyss.ttf",70 );
  textFont( kirby );
  fill( 0xffffffff, 255 );
  text( "Game Over !", width / 2, 130 );
  textSize( 18 );
  fill( 0xffa52a2a, 200 );
  text( "-press A to try agian-", width / 2, 180 );
  textAlign( CENTER, CENTER );

}; //end draw




};// end gameover screen

  
  
static class game_state_manager{


public  enum state {
  ATRACT,
  PLAYING,
  IN_MENU,
  GAME_OVER,
  PAUSED;
  
  
}

  // Constructor
  private void  game_state_manager() {
  
     
  
  };
  
};

 
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
                    inventory.removePlayer_item(inventory.tools[0]);
    }


};


};
class pause_screen{
//constructor
public pause_screen(){


};

public void draw(){
  
  PFont kirby;
  background( bg );
  fill( 0xffcafb98, 150 );
  rect( 20, 90, 600, 110, 7 );
  kirby = createFont( "kirbyss.ttf", 100 );
  textFont( kirby );
  fill( 0xffffffff, 255 );
  text( "PAUSED", width / 2, 130 );
  textSize( 32 );
  fill( 0xffa52a2a, 200 );
  text( "Press -A- to resume", width / 2, 180 );
  textAlign( CENTER, CENTER );
  
  
  
  
};





};//end pause class
// this class is dependant on a named insance of collision_handler probly better to pass in the object
class playing_screen{
 //the game proccesses collisons wen playing so  impliment the colliion handler here.
  collision_handler collision = new collision_handler();

public playing_screen( ){

};

// method for playign screen to draw itslef
public void draw(){
  
    background( bg );
  collision.processCollisions();
  //  initPlayer();
  //  initShrooms();
  //  initInventory();
  //S4P.drawSprites();
  inventory.drawInventory();
 hud.draw();
  
  
  
  
};






};
class tennysplaer{

String name;

public tennysplaer()

{

name = "Tenny";

}





}
  public void settings() {  size( 640, 360 ); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Shroomy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
