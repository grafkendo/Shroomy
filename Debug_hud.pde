class Debug_hud{



public void draw(){

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
  fill(0,152,153,100);
  
  textSize(10);
  text("shrm 2 pos " + shrm_2pos ,10,70);
  fill(0,152,153,100);
  
  textSize(10);
  text("shrm 3 pos " + shrm_3pos ,10,90);
  fill(0,152,153,100);
  
  textSize(10);
 text("Player position " + plyr_pos ,10,110);
  fill(0,152,153,100);
  
 //text("inventory: " + inventory[0]._name,10,130);

};

};