
/// is this the git hub version?
import sprites.*;
import sprites.maths.*;
import sprites.utils.*;
 

// draw a sprite from documentation
/**
 * Bouncy Bubbles  
 * based on code from Keith Peters. 
 * 
 * Multiple-object collision.
 */
 
PImage img;  //mushroom image Declare variable "a" of type PImage
PImage bg;

//Game states

//  atract_start, playing, game_over, paused
// save as emum or an object
public enum GameState{ATRACT, PLAYING ,GAME_OVER ,PAUSED;
// Constructor

 

 private GameState(){

  
 };


};
// saparate draw functions for each game state
// variable for game states
GameState state ;

 
 
//player states CONSTANTS
final float PLYR_VEL = 100;
final int PLYR_STOPED = 0;
final int PLYR_LEFT = -1;
final int PLYR_RIGHT = +1;
final boolean PLYR_ADDWATER = false;
final boolean PLYR_ADDSEED = false;

 
// Current player state
int playerState = PLYR_STOPED;
StopWatch sw = new StopWatch();
int numshroom = 3;
//declarations
//Sprite player;
Player player;
inventory  inventory;
Player_item[] shrooms = new Player_item[numshroom];
Sprite greenShroom;
Sprite redShroom;
Sprite blueShroom;
Sprite monarch;

Debug_hud hud;

//pysics
float spring = 0.05;                                                           
float gravity = 0.03;
float friction = -0.9;
 


  



public void pre() {
  // Calculate time difference since last call
   
  float elapsedTime = (float) sw.getElapsedTime();
  S4P.updateSprites(elapsedTime);
}



////Controlls
public void keyEvent(KeyEvent e) {
  if (key == CODED) {
    switch(keyCode) {
  
    case UP:
     player.setVelX(0);
      playerState = PLYR_STOPED;
   player._Sprite.setFrameSequence(14,16,0.2f);
      break;
    case LEFT:
      player.setVelX(PLYR_LEFT * PLYR_VEL);
      playerState = PLYR_LEFT;
      player._Sprite.setFrameSequence(0,2,0.1f);
      break;
    case RIGHT:
      player.setVelX(PLYR_RIGHT * PLYR_VEL);
      playerState = PLYR_RIGHT;
      player._Sprite.setFrameSequence(3,5,0.1f);
      break;
     case DOWN:
      player.setVelX(0);
      playerState = PLYR_STOPED;
     player._Sprite.setFrameSequence(12,13,0.3f);
      break;
    }
  }
  }
  
  
  // Draw game states //  atract_start, playing, game_over, paused
  public void drawAtract(){ 
      
    
    PFont kirby;
    background(bg);
    fill(#cafb98,150);
    rect(70, 90, 500, 110, 7);
    kirby = createFont ("kirbyss.ttf",100);
    textFont(kirby);

  fill(#ffffff,255);
  text("SHROOMY",width/2,130);
  textSize(32);
  fill(#a52a2a,200);
  text("-press A to start-",width/2,180);
  textAlign(CENTER,CENTER);
  //fill(0,152,153,100);
  //TODO:  clear font ..... 
  };
  
  public void drawPlaying(){ 
background(bg);
processCollisions();
//  initPlayer();
//  initShrooms();
//  initInventory();
  
  //S4P.drawSprites();
  inventory.drawInventory();
  
  
  };
  
  public void drawGameOver() { 
  PFont kirby;
    background(bg);
    fill(#cafb98,150);
    rect(70, 90, 500, 110, 7);
    kirby = createFont ("kirbyss.ttf",100);
    textFont(kirby);

  fill(#ffffff,255);
  text("paused",width/2,130);
  textSize(32);
  fill(#a52a2a,200);
  text("-press A to start-",width/2,180);
  textAlign(CENTER,CENTER);

};
  
  public void drawPaused() {   };
  
  

  
  
  
  ///process collisions
public void processCollisions(){
 // / iterate through all objects on screen proc if hit on player
    
   for(int i = 0;i< shrooms.length;i++ ){
    if(shrooms[i]._sprite.oo_collision(player._Sprite,3)){
    
    print("Hit!");
    PFont kirby;
    
    kirby = createFont ("kirbyss.ttf",32);
    textFont(kirby);
     textSize(25);
  text(" Press A \n to Pick up ",width /2,height /2 -50);
  textAlign(CENTER,CENTER);
  //fill(0,102,153,100);
    inventory.addPlayer_item(shrooms[i]);
   // shrooms[i]._sprite.setXY(55,55);
    shrooms[i]._sprite.setVelXY(0,0);
    //shrooms[0].setDead(true);
    
    };// end if
  
  };//end loop
  
};// end proc collisions
 public void initAtract(){
 monarch = new Sprite(this,"butterfly_sprite2.png",10,4,0,true);
 //TODO: adjust monarch frame sequence for left and right flying.
 monarch.setFrameSequence(10,20,0.05f);
 monarch.setDomain(5,5,width,height,Sprite.REBOUND); 
 monarch.setVelX(100);
 monarch.setVelY(50);
 
 
 };
    
    
public void initHud(){
    
    hud = new Debug_hud();
    print("Console: " + "initilize the HUD ! " +"\n");
    
};
    
public void initPlayer(){   
  
  // note sprites can only be created in setup becaue of image load
player = new Player();
player._Sprite = new Sprite(this,"brown_farmer2.png",7,4,0,true);
player._Sprite.setDomain(5, 360,width +10, height, Sprite.REBOUND);
player._Sprite.setXY(width/2,275); 

print("Console: " + "player initialized ! " +"\n");
 
};
  
 
// init shrooms method to move each mushroom
public void initShrooms(){
  String[] images = new String[3];
  images[0] = "RetroMushroom.png";
  images[1] = "RetroMushroom2.png";
  images[2] = "RetroMushroom3.png";
  
    for (int i = 0; i < numshroom; i++) {
     
      shrooms[i] = new Player_item("shroom +i,","common");
      shrooms[i]._sprite = new Sprite(this,images[i],1,1,0);
      shrooms[i]._sprite.setDomain(1,1,width,height,Sprite.REBOUND);
      shrooms[i]._sprite.setScale(0.1f);
      
      // station ary shrooms for pick up test
      shrooms[i]._sprite.setVelX(0);
     // shrooms[i]._sprite.setVelX((i+2)*10);
     
     //spread the stationary mushrooms starting points out
      shrooms[i]._sprite.setXY(200*i,305 + (5*i));

    }
    print("Console: " + "shroom array initialized ! " +"\n");
};

public void initInventory(){
inventory = new inventory();
inventory.tools[0] = new Player_item("rock","common");
print("Console: " + "inventory initialized ! \n");


};

public void initGameState(){
    

state = GameState.PLAYING;

};

void setup() {// set up runs once

size(640, 360);
// The image file must be in the data folder of the current sketch 
// to load successfully
 
img = loadImage("RetroMushroom.png");
bg = loadImage("bg_day640x360.png");
initAtract();
initGameState();

initHud();

initPlayer();

initInventory(); 

initShrooms();

registerMethod("pre", this);
registerMethod("keyEvent", this);

}// end set up


public void draw() {
 
  
// switch to draw method per gamestate 
// Draw game states //  atract_start, playing, game_over, paused switch on [gameState]

switch(state){
  case ATRACT:drawAtract();
  
    break;
  case PLAYING: drawPlaying();
   
    break;
  case GAME_OVER:drawGameOver();
    break;
  case PAUSED: drawPaused();
    break;
   // default: drawAtract();
  
    




};// end switch

  
  
  
//background(bg);
 
S4P.drawSprites();

//inventory.drawInventory();
// to do change thsi so that the game uses an instance of Player object
//processCollisions();
//hud.draw();

  
}//end draw
 
 
 