Button[][] map;
int millis;
int state;
void setup(){
  size(250,250);
  map = new Button[4][4];
  for (int i = 0; i < 4; i++){
    for (int j = 0; j < 4; j++){
      map[i][j] = new Button(50 * i, 50 * j, 50, 50);
    }
  }
  millis = millis();
  state = 0;
  map[(int)random(4)][(int)random(4)].onBinaryState();
  map[(int)random(4)][(int)random(4)].onBinaryState();
}

void draw(){
  for(int i = 0; i < map.length; i++){
    for (int j = 0; j < map[i].length; j++) {
      map[i][j].draw();
    }
  }
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      print("VK_LEFT");
      left();
    }else if(keyCode == UP){
      print("VK_UP");
      up();
    }else if(keyCode == RIGHT){
      print("VK_RIGHT");
      right();
    }else if(keyCode == DOWN){
      print("VK_DOWN");
      down();
    }
  }
  createBinary();
}
void up(){
  int sum = 0;
  int sumIndex = 0;
  int nullIndex = 0;

  for(int i = 0 ; i < map.length ; i++){
    sum = 0;
    sumIndex = 0;
    nullIndex = 0;
  
    for(int j = 0 ; j < map.length ; j++){
      if(map[i][j].state != 0){
        if(sum == 0){
          sum = map[i][j].state;
          sumIndex = j;
        }else if(sum == map[i][j].state){
          map[i][sumIndex].state = sum*2;
          map[i][j].state = 0;
        }else if(sum != map[i][j].state){
          map[i][nullIndex++].state = sum;
          sum = map[i][j].state;
          sumIndex = j;
        }
      }
      if(sum != 0){
        map[i][nullIndex].state = sum;
        map[i][sumIndex].state = 0;
      }
    }
  }
}
void down(){
  
}
void left(){
  
}
void right(){
  
}
void createBinary(){
  int x = (int)random(4);
  int y = (int)random(4);

  while(true){
    if(map[x][y].state != 0){
      x = (int)random(4);
      y = (int)random(4);
    } else {
      map[x][y].onBinaryState();
      break;
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

  void onBinaryState(){
    if((int)random(2) == 0){
      state = 2;
    }else{
      state = 4;
    }
  }
}
