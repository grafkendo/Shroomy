/* this should be called somethig else like shroom bank the class create s some dummy playeritems and returns  an array for use itn te main program
contains method to get the shroom and constructor maybe a funciton to register new game items  shroom manager
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
 red = new Player_item("redshroom","common");
 
 blue = new Player_item("redshroom","common");
  
 green = new Player_item("redshroom","common");
 
 
 
 // eventually a loop will eliminat e this duplicat ecode
 
 red._sprite = new Sprite(Shroomy.this,"RetroMushroom.png",1,1,0);
   red._sprite.setDomain( 1, 1, width, height, Sprite.REBOUND );
     red._sprite.setScale( 0.1f );
       red._sprite.setVelX( 0 );
 
 blue._sprite = new Sprite (Shroomy.this,"RetroMushroom2.png",1,1,0);
   blue._sprite.setDomain( 1, 1, width, height, Sprite.REBOUND );
     blue._sprite.setScale( 0.1f );
       blue._sprite.setVelX( 0 );
 
 green._sprite = new Sprite (Shroomy.this,"RetroMushroom3.png",1,1,0);
   green._sprite.setDomain( 1, 1, width, height, Sprite.REBOUND );
     green._sprite.setScale( 0.1f );
       green._sprite.setVelX( 0 );

 
  shrooms[0]= red;
  shrooms[1]= blue;
  shrooms[2]= green;
  
  
 }
 
 
 
 
 public Player_item[] getshrooms()
 {
 
  return shrooms;
 
 }
 
 
 }