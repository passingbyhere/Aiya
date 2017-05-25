class Player {
  private int points, strikes, level;
  private float sX, sY;
  
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
  public int getStrikes(){
    return strikes;
  }
  public int getLevel(){
    return level;
  }
  
  //mutators
  public float setsX(float x){
    sX = x;
  }
  public float setsY(float y){
    sY = y;
  }
  public int setPoints(int pts){
    points = pts;
  }
  public int setStrikes(int STRIKES){
    strikes = STRIKES;
  }
  public int setLevel(int lvl){
    level = lvl;
  } 
  
  
}