import  java.util.LinkedList ;


public class inventory {
  // inventory slot positions this class is for the palyer inventor not the world inventory
  
  // inventory count

 

  
  int slotA = 55;
  private Player_item[] tools = new Player_item[5];
   
  int open_position  = 0;
  int tool_count =0;
  int tool_label_pos = 0;
   Player_item star;
 Player_item heart;
  //private ArrayList < Sprite > icons = new ArrayList < Sprite > ();
  //// this is for the players inventory
  
  //constructor
  public inventory() {
    

          

  tools[0] = new Player_item("empty", "common");
 tools[ 1 ] = new Player_item( "empty", "common" );
   tools[2] = new Player_item("empty", "common");
 tools[ 3 ] = new Player_item( "empty", "common" );
   tools[4] = new Player_item("empty", "common");
 
  print( "Console: " + "inventory initialized ! \n" );
    addPlayer_item(heart);
    addPlayer_item(star);
  };
  
  
  //void AddShroom(Sprite shroom) {
  //  icons.add(shroom);
  //  shroom.isDead();
  //  shroom.setXY(slotA, 55);
  //  print("add shoom called");
  //};
  
  
  void addPlayer_item(Player_item item) {
   
   
    item._sprite.setVelXY( 0, 0 );
    open_position += 55;
    item._sprite.setXY(open_position,55);
    tools[tool_count] = item;
    tool_count +=1;
    tool_label_pos += 55;
    
  }; // end add item
  
  
  void selectPlayer_item(){
  
  
  }
  
  
  void removePlayer_item(Player_item item) {
  
  
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
 text(p._name,position,75);
  
 position += 55;
  }
    // dividers
    line(80, 35, 80, 75);
    line(135, 35, 135, 75);
    line(190, 35, 190, 75);
  };
};