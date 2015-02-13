Button[][] map;
void setup(){
  size(250,250);
  map = new Button[4][4];
  for (int i = 0; i < 4; i++){
    for (int j = 0; j < 4; j++){
      map[i][j] = new Button(50 * i, 50 * j, 50, 50);
    }
  }
}

void draw(){
  int set = 0;
  
  for(int i = 0; i < map.length; i++){
    for (int j = 0; j < map[i].length; j++) {
      map[i][j].draw();
    }
  }
  
  while(set<2){
    int x = (int)random(4);
    int y = (int)random(4);
    
    if(map[x][y].state != 0){
      print(map[x][y].state,"\n");
      map[x][y].onBinaryState();
      
      set++;
    }
  }
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      print("VK_LEFT");
    }else if(keyCode == UP){
      print("VK_UP");
    }else if(keyCode == RIGHT){
      print("VK_RIGHT");
    }else if(keyCode == DOWN){
      print("VK_DOWN");
    }
  }
}

class Button{
  int _x, _y;
  int _w, _h;
  int state;
  
  Button(int x, int y, int w, int h){
    _x = x;
    _y = y;
    _w = w;
    _h = h;
    state = 0;    
  }

  void draw(){
    fill(255);
    rect(_x, _y, _w, _h);

    textAlign(CENTER,CENTER);
    fill(0);
    text("" + state, _x + (_w / 2) , _y + (_h / 2));
  }
  void createBinary(){
    int x = (int)random(4);
    int y = (int)random(4);

    while(true){
      if(map[x][y].state != 0){
        map[x][y].onBinaryState();
      }
    }
  }

  void onBinaryState(){
    if((int)random(2) == 0){
      state = 2;
    }else{
      state = 4;
    }
  }
}
