public class inventory {
  // inventory slot positions
  int slotA = 55;
  private Player_item[] tools = new Player_item[3];
  private ArrayList < Sprite > icons = new ArrayList < Sprite > ();
  
  
  //constructor
  public inventory() {

  tools[0] = new Player_item("water can", "common");
  tools[ 0 ] = new Player_item( "rock", "common" );
  print( "Console: " + "inventory initialized ! \n" );
    
  };
  
  
  void AddShroom(Sprite shroom) {
    icons.add(shroom);
    shroom.isDead();
    shroom.setXY(slotA, 55);
    print("add shoom called");
  };
  void addPlayer_item(Player_item item) {
    // check for space in inventory
    // add item
  }; // end add item
  void removePlayer_item(Player_item item) {}; // end remove item
  void drawInventory() {
    // draw the grid boxes
    //main box
    line(30, 30, 600, 30);
    stroke(255);
    line(600, 30, 600, 80);
    stroke(255);
    line(600, 80, 30, 80);
    stroke(255);
    line(30, 80, 30, 30);
    textSize(10);
    text(tools[0]._name, 40, slotA);
    // dividers
    line(80, 35, 80, 75);
    line(135, 35, 135, 75);
    line(190, 35, 190, 75);
  };
};