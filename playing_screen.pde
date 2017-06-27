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
  //hud.draw();
  
  
  
  
};






};