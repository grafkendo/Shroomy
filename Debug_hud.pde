class Debug_hud{



public void draw(){
 int left_margin =5;
 int inventoryLine =120;
  int output = inShrooms.shrooms.length;
  double shrm_1pos = Math.round(inShrooms.shrooms[0]._sprite.getX());
  double shrm_2pos = Math.round(inShrooms.shrooms[1]._sprite.getX());
  double shrm_3pos = Math.round(inShrooms.shrooms[2]._sprite.getX());
  double plyr_pos =  Math.round(player.getX());
  

  textSize(25);
  
  text("shroomy sees " + output + " mushrooms onscreen",10,30);
  fill(20,102,153,100);
  
  textSize(10);
  text("shrm 1 pos " + shrm_1pos ,10,50);
  fill(left_margin,152,153,100);
  
  textSize(10);
  text("shrm 2 pos " + shrm_2pos ,10,70);
  fill(left_margin,152,153,100);
  
  textSize(10);
  text("shrm 3 pos " + shrm_3pos ,10,90);
  fill(left_margin,152,153,100);
  
  textSize(10);
 text("Player position " + plyr_pos ,10,110);
  fill(left_margin,152,153,100);
  for(Player_item p: inventory.tools){
 text("Player inventory: " + p._name,50,inventoryLine);
 inventoryLine += 10;
  }
  

  
};

};