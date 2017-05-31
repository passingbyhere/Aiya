class Ingredients{
  float ix,iy;
  float x;
  String name;
  int w,h;
  color c;
  int status; //0 = in fallIngredients, 1 = falling, 2 = in sandwichStack, 3 = disappeared at the bottom of screen
  
  Ingredients(String n,int W, int H, int R, int G, int B){
    name = n;
    w = W;
    h = H;
    c = color(R, G, B);
    ix = (float)(random(width));
    x = ix;
    iy = 0;
    status = 0;
  }
  
  /*void move(Player player){
    if(status == 1){
      iy += 0.05;
      if(iy == player.getsY() && ix == player.getsX()){
        status = 2;
      }
    }
    if(iy == height){
      status = 3;
    }
    if(status == 2){
      ix = mouseX;
    }
    fill(c);
    rect(ix,iy,w,h);
  }*/
  
  void move(Player player){
    if ((int)iy == (int)player.getsY() && (int)ix >= (int)player.getsX() && (int)ix <= (int)player.getsX() + 20){
      status = 2;
    }
    if (status == 1){
      iy += 0.05;
    }
    if (iy >= height){
      status = 3;
      iy = 800;
    }
    if(status == 2){
      ix = mouseX + x;
    }
    fill(c);
    rect(ix,iy,w,h);
  }
  
  //toString
  String toString(){
    return name;
  }
  
  //accessor
  int getStatus(){
    return status;
  }
  color getColor(){
    return c;
  }
  
  //mutator
  void setStatus(int stat){
    status = stat;
  }
}
  
  