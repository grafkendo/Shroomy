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

 Player_item star;
 Player_item heart;
 
 Player_item[] shrooms;
 
 
 
 
 public add_shrooms(){
 
 shrooms = new Player_item[5];
 red = new Player_item("alvin","common");
 
 blue = new Player_item("simon","common");
  
 green = new Player_item("teddy","common");
 
star = new Player_item("star","legendary");
heart = new Player_item("heart","rare");
 
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
            
            
            
            
  
     
     // star._sprite = new Sprite(Shroomy.this,"star.png",1,1,0);
   //ar._sprite.setDomain( 1, 1, width, height, Sprite.REBOUND );
     //star._sprite.setScale( 0.1f );
     //  star._sprite.setVelX( 0 );
     //  star._sprite.setY(300.2f);
     //     star._sprite.setX(350.2f);
          
          
          
          
     //      heart._sprite = new Sprite(Shroomy.this,"heartresized.png",1,1,0);
//rt._sprite.setDomain( 1, 1, width, height, Sprite.REBOUND );
     //heart._sprite.setScale( 0.1f );
     //  heart._sprite.setVelX( 0 );
     //  heart._sprite.setY(300.2f);
     //     heart._sprite.setX(450.2f);
            
            
            
            
            

 
  shrooms[0]= red;
  shrooms[1]= blue;
  shrooms[2]= green;
    //shrooms[3]= star;
    //shrooms[4]= heart;
  
  
 }
 
 
 
 
 public Player_item[] getshrooms()
 {
 
  return shrooms;
 
 }
 
 
 }