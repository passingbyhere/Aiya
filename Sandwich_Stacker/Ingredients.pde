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
    ix = (float)(random(600));
    x = ix;
    iy = 0;
    status = 0;
  }
  
  Ingredients(Ingredients i){
    name = i.name;
    w = i.w;
    h = i.h;
    c = i.c;
    x = (float)(random(600));
    iy = i.iy;
    status = i.status;
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
  
  Ingredients getInstance() {
    Ingredients i = new Ingredients(this);
    i.x = random(600);
    return i;
  }
  
  void move(Player player){
    if ((int)iy == (int)player.getsY() - h && (int)ix >= (int)player.getsX()){//player.getsX() && (int)ix <= (int)player.getsX() + 20){
      status = 2;
      player.setsY(player.getsY() - h);
      //iy = player.getsY();
    }
    if (status == 1){
      iy += 1;
    }
    if (iy >= height){
      status = 3;
      iy = 800;
    }
    if(status == 2){
      ix = mouseX + 50;
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
  float getiX(){
    return ix;
  }
  float getiY(){
    return iy;
  }
  
  //mutator
  void setStatus(int stat){
    status = stat;
  }
}
  
  