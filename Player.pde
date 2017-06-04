public class Player{
  //private instance variables
    private Sprite _Sprite;
    //public variables
    

  // constructors
   public void player(Sprite s){
    _Sprite = s;
   };// end constructor
  
 
    
 // methods
 public void initilize(){
 this._Sprite.setDomain(5,5,width-5,height-5,Sprite.REBOUND);
 this._Sprite.setXY(width/2, 275);
 
 
 };
 
 public void setVelX(float vx){
 
 _Sprite.setVelX(vx);
 
 };
 public int getX(){
   
  return  (int)(_Sprite.getX());
  
 };
 
 public int getY(){
   
  return  (int)(_Sprite.getY());
  
 };
 
 public void processCollisions(){
  
    
    if(player._Sprite.oo_collision(shrooms[0]._sprite,3)){
    
    print("Hit!");
     textSize(25);
  text("HIT!",width /2,height /2);
  fill(20,102,153,100);
    
    inventory.addPlayer_item(shrooms[0]);
    
    };
  
  
  
  };

   public Sprite getSprite(){
   
   
   return _Sprite;
   };




};// end class
 