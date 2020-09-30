void setup() {
  size(720, 720);
}

void draw() {
}

class Robot {
  int row, column, size;     //Set row, column, size as attribute
  float heightPerBlock, widthPerBlock, radian;  //Set height,wieght per block and degree as attribute

  Robot(int row, int column, int size, float widthPerBlock, float heightPerBlock) {
  }

  void move(int args) {    //move method to move row with args
  }

  void turn(int args) {   //turn method to turn column with args
  }

  void drawRobot() {   //draw robot
  }

  int getRow() {
    return 0;
  }

  int getColumn() {
    return 0;
  }
}

class Wall {
  int row, column, size;      //Set row, column, size as attribute
  float widthPerBlock, heightPerBlock;  //Set width,height per block as attribute


  Wall(int row, int column, int size, float widthPerBlock, float heightPerBlock) {
  }

  void drawWall() {
  }

  int getRow() {
    return 0;
  }

  int getColumn() {
    return 0;
  }
}

class Objective {
  int row, column, size; //Set row, column, size as attribute
  float widthPerBlock, heightPerBlock;  //Set width,height per block as attribute

  Objective(int row, int column, int size, float widthPerBlock, float heightPerBlock) {
  }


  void drawObjective() {
  }

  int getRow() {
    return 0;
  }

  int getColumn() {
    return 0;
  }
}

class World {
  int row, column; //set row, column as attribute
  float widthPerBlock;  //set height,width as attribute
  float heightPerBlock;
  Robot myRobot;        //set myRobot that is Robot object as attribute
  Objective myObjective;  //set myObject that is Objective object as attribute
  Wall[] myWall;         //set myWall that is Wall[] object as attribute

  World(int row, int column) {

  }

  void drawLine() { //draw line
  }

  void drawWorld() {
  }

  void updateWorld(){
  }

  boolean targetCheck(){
    return true;
  }

}
