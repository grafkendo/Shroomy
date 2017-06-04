

 public class Player_item {
  //private instance variables
  
  // referance to sprite associated wi th this object
   Sprite _sprite;
    //public variables
    boolean _selected;
    String _name = " dust";
    String _type;
    int _weight;
    int _quality;
    String _effect;
   
    float xPos;
    float yPos;
    

  // constructors
   public  Player_item(String n,String t) //<>//
   {
    _name = n;
    _type = t;
    _weight = 1;
    _quality = 1;
    _selected = false;
    print(" player item contructor called  \n ");
   }// end constructor
   
   
     
   
   public void useItem(Player_item target){
     
   
   };
   
};//end class