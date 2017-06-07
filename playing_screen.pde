// this class is dependant on a named insance of collision_handler probly better to pass in the object
class playing_screen{


public playing_screen(){};


public void draw(){
  
    background( bg );
  collision.processCollisions();
  //  initPlayer();
  //  initShrooms();
  //  initInventory();
  //S4P.drawSprites();
  inventory.drawInventory();
  
  
  
  
};






};