import  java.util.LinkedList ;


public class inventory {
  // inventory slot positions this class is for the palyer inventor not the world inventory

  int slotA = 55;
  private Player_item[] tools = new Player_item[6];
   
  int open_position  = 0;
  int tool_count =0;
  int tool_label_pos = 0;
  
  //private ArrayList < Sprite > icons = new ArrayList < Sprite > ();
  //// this is for the players inventory
  
  //constructor
  public inventory() {
 print( "Console: " + "inventory initialized ! " );
  //this.tools[0] = new Player_item("empty", "common");
 //this.tools[ 1 ] = new Player_item( "empty", "common" );
  // this.tools[2] = new Player_item("empty", "common");
 //this.tools[ 3 ] = new Player_item( "empty", "common" );
  // this.tools[4] = new Player_item("empty", "common");
 
  };

  //void AddShroom(Sprite shroom) {
  //  icons.add(shroom);
  //  shroom.isDead();
  //  shroom.setXY(slotA, 55);
  //  print("add shoom called");
  //};
  
  //pickup add item to inventory.tools
  void addPlayer_item(Player_item item) {
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
  
  
  void setSelected(){
  // set selevted variable to the index within tools enventory
  
  }

  //drop
  void removePlayer_item(Player_item item) {
  // move item to position of player
  if(item != null){
        item._sprite.setXY(player.getX()+100,player.getY()-30);
  // move item from tools array to shrooms(world inventory)
  
  inShrooms.shrooms[1] = item;
  
  int ndex = java.util.Arrays.asList(inventory.tools).indexOf(item);
  inventory.tools[ndex] =null;
  tool_count -= 1;
  }
  }; // end remove item
  
  
  void drawInventory() { 
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