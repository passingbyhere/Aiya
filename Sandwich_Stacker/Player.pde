class Player{
  private int points, level, lvlPoints;
  private float sX, sY;
  ALStack<Ingredients> sandwich = new ALStack<Ingredients>();
  //how many ingreidents are in each type of sanwich that is created
  private int bacon, cheese, egg, tomato, beef, lettuce, onion, ham, badEgg, bananaPeel;
  //constructor
  Player(){
    points = 0;
    level = 1;
    sX = mouseX;
    sY = 500;
  }
  
  //accessors
  public float getsX(){
    return sX;
  }
  public float getsY(){
    return sY;
  }
  public int getPoints(){
    return points;
  }
  public int getlvlPoints(){
    return lvlPoints;
  }
  public int getLevel(){
    return level;
  }
  public int getBacon(){
    return bacon;
  }
  public int getCheese(){
    return cheese;
  }
  public int getEgg(){
    return egg;
  }
  public int getTomato(){
    return tomato;
  }
  public int getLettuce(){
    return lettuce;
  }
  public int getBeef(){
    return beef;
  }
  public int getOnion(){
    return onion;
  }
  public int getHam(){
    return ham;
  }
  public int getbadEgg(){
    return badEgg;
  }
  public int getbananaPeel(){
    return bananaPeel;
  }
  
  //mutators
  public void setsX(float x){
    sX = x;
  }
  public void setsY(float y){
    sY = y;
  }
  public void setPoints(int pts){
    points = pts;
  }
  public void setlvlPoints(int pts){
    lvlPoints = pts;
  }
  public void setLevel(int lvl){
    level = lvl;
  } 
  public void setBacon(int b){
    bacon = b;
  }
  public void setCheese(int c){
    cheese = c;
  }
  public void setEgg(int e){
    egg = e;
  }
  public void setTomato(int t){
    tomato = t;
  }
  public void setLettuce(int l){
    lettuce = l;
  }
  public void setBeef(int b){
    beef = b;
  }
  public void setOnion(int o){
    onion = o;
  }
  public void setHam(int h){
    ham = h;
  }
  public void setbadEgg(int be){
    badEgg = be;
  }
  public void setbananaPeel(int bp){
    bananaPeel = bp;
  }
  
}