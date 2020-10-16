/* can run snake but not implement with Snake Class */


World myRobotWorld;  //Set myRobotWorld as object of World
void setup() {
  size(720, 720);
  myRobotWorld = new World(12, 12);     //Instance World that have 12*12 siz
}

void draw() {
  background(40);  //Draw black background
  noStroke();
  myRobotWorld.drawLine();      //Draw World line
  myRobotWorld.drawWorld();     //Draw all of World
}

void keyReleased() {
  myRobotWorld.updateWorld();
}

class Robot {
  int row, column, size;     //Set row, column, size as attribute
  float heightPerBlock, widthPerBlock;  //Set height,wieght per block and degree as attribute
  int radian;
  Robot(int row, int column, int size, float widthPerBlock, float heightPerBlock) {
    radian = 0;                //set start degree is 0 radian
    this.row = row;
    this.column = column;
    this.size = size;
    this.widthPerBlock = widthPerBlock;
    this.heightPerBlock = heightPerBlock;
  }

  void move(int args) {    //move method to move row with args
    if (radian == 0) {
      //print(row);
      row += args;
    } else if (radian == 180) {
      //print(row);
      row -= args;
    } else if (radian == 90) {
      //print(column);
      column += args;
    } else if (radian == 270) {
      //print(column);
      column -= args;
    }
  }

  void turn(int args) {   //turn method to turn column with args
    if (args == 1) {
      this.turnLeft();
    } else {
      this.turnRight();
    }
    println(radian);
  }

  void turnLeft() {
    radian += 90;
    if (radian >= 360) {
      radian -= 360;
    }
  }

  void turnRight() {
    radian += 270;
    if (radian >= 360) {
      radian -= 360;
    }
  }

  void drawRobot() {   //draw robot
    stroke(155, 100, 255);
    strokeWeight(5);
    if (radian == 0) {
      line(widthPerBlock*row, heightPerBlock*column, widthPerBlock*row + widthPerBlock, heightPerBlock*column + heightPerBlock/2);
      line(widthPerBlock*row, heightPerBlock*column + heightPerBlock, widthPerBlock*row + widthPerBlock, heightPerBlock*column + heightPerBlock/2);
      line(widthPerBlock*row, heightPerBlock*column, widthPerBlock*row, heightPerBlock*column + heightPerBlock);
    } else if (radian == 90) {
      line(widthPerBlock*row, heightPerBlock*column, widthPerBlock*row + widthPerBlock/2, heightPerBlock*column + heightPerBlock);
      line(widthPerBlock*row + widthPerBlock, heightPerBlock*column, widthPerBlock*row + widthPerBlock/2, heightPerBlock*column + heightPerBlock);
      line(widthPerBlock*row, heightPerBlock*column, widthPerBlock*row + widthPerBlock, heightPerBlock*column);
    } else if (radian == 180) {
      line(widthPerBlock*row + widthPerBlock, heightPerBlock*column, widthPerBlock*row, heightPerBlock*column + heightPerBlock/2);
      line(widthPerBlock*row + widthPerBlock, heightPerBlock*column + heightPerBlock, widthPerBlock*row, heightPerBlock*column + heightPerBlock/2);
      line(widthPerBlock*row + widthPerBlock, heightPerBlock*column, widthPerBlock*row + widthPerBlock, heightPerBlock*column + heightPerBlock);
    } else if (radian == 270) {
      line(widthPerBlock*row, heightPerBlock*column + heightPerBlock, widthPerBlock*row + widthPerBlock/2, heightPerBlock*column);
      line(widthPerBlock*row + widthPerBlock, heightPerBlock*column + heightPerBlock, widthPerBlock*row + widthPerBlock/2, heightPerBlock*column);
      line(widthPerBlock*row, heightPerBlock*column + heightPerBlock, widthPerBlock*row + widthPerBlock, heightPerBlock*column + heightPerBlock);
      println("hello");
    }
  }

  int getRow() {
    return row;
  }

  int getColumn() {
    return column;
  }

  int getRadian() {
    return radian;
  }
}

class Wall {
  int row, column, size;      //Set row, column, size as attribute
  float widthPerBlock, heightPerBlock;  //Set width,height per block as attribute


  Wall(int row, int column, int size, float widthPerBlock, float heightPerBlock) {
    this.row = row;
    this.column = column;
    this.size = size;
    this.widthPerBlock = widthPerBlock;
    this.heightPerBlock = heightPerBlock;
  }

  void drawWall() {
    fill(100, 100, 80);
    rect(widthPerBlock*row+2, heightPerBlock*column+2, widthPerBlock-2, heightPerBlock-2);    //fill the block
  }

  int getRow() {
    return row;
  }

  int getColumn() {
    return column;
  }
}

class Objective {
  int row, column, size; //Set row, column, size as attribute
  float widthPerBlock, heightPerBlock;  //Set width,height per block as attribute

  Objective(int row, int column, int size, float widthPerBlock, float heightPerBlock) {
    this.row = row;
    this.column = column;
    this.size = size;
    this.widthPerBlock = widthPerBlock;
    this.heightPerBlock = heightPerBlock;
  }


  void drawObjective() {
    fill(255, 100, 80); //fill red
    ellipse(widthPerBlock*row + widthPerBlock/2, heightPerBlock*column + heightPerBlock/2, size, size); //draw circle object
  }

  int getRow() {
    return row;
  }

  int getColumn() {
    return column;
  }
}

class World {
  int row, column; //set row, column as attribute
  float widthPerBlock;  //set height,width as attribute
  float heightPerBlock;
  Robot[] myRobot;        //set myRobot that is Robot object as attribute
  Objective myObjective;  //set myObject that is Objective object as attribute
  Wall[] myWall;         //set myWall that is Wall[] object as attribute
  int wallSize = 20;
  int snakeSize = 4;

  World(int row, int column) {
    this.row = row;
    this.column = column;
    heightPerBlock = height/column; //calculate height,width per block
    widthPerBlock = width/row;
    myRobot = new Robot[snakeSize];
    for (int j=snakeSize-1; j>=0; j--) {
      myRobot[j] = new Robot(7-j, 2, 40, widthPerBlock, heightPerBlock);    //instance myRobot at 1,2 size =40 ,and send width,heigh per block
      println(myRobot[j]);
    }
    myObjective =  new Objective(11, 11, 40, widthPerBlock, heightPerBlock); //instance myObject at 11,11 size =40 ,and send width,heigh per block
    int i = 0;
    myWall = new Wall[20];
    while ( i<wallSize) {
      int x = (int)random(0, 12);
      int y = (int)random(0, 12);
      if ( /*x != myRobot.getRow() && y != myRobot.getColumn() && x != myObjective.getRow() && y != myObjective.getColumn()*/ true ) {
        myWall[i] = new Wall(x, y, 40, widthPerBlock, heightPerBlock); //random wall position
        i++;
      }
    }
  }
  /* World(String filename) {
   String[] lines = loadStrings(filename);
   String[] line1 = split(lines[0], '=');
   String[] worldSizes = split(line1[1], ',');
   this.row = int(worldSizes[0]);
   this.column = int(worldSizes[1]);
   
   heightPerBlock = height/column; //calculate height,width per block
   widthPerBlock = width/row;
   
   String[] line2 = split(lines[1], '=');
   String[] robotPos = split(line2[1], ',');
   myRobot = new Robot(int(robotPos[0]), int(robotPos[1]), 40, widthPerBlock, heightPerBlock);
   
   String[] line3 = split(lines[2], '=');
   String[] objectivePos = split(line3[1], ',');
   myObjective =  new Objective(int(objectivePos[0]), int(objectivePos[1]), 40, widthPerBlock, heightPerBlock);
   
   String[] line4 = split(lines[3], '=');
   wallSize = int(line4[1]);
   myWall = new Wall[wallSize];
   for (int i =4; i<wallSize+4; i++) {
   String[] position = split(lines[i], ',');
   println(position[0]);
   myWall[i-4] = new Wall(int(position[0]), int(position[1]), 40, widthPerBlock, heightPerBlock);
   }
   } */

  void drawLine() { //draw line
    fill(255);
    for (int i = 0; i<=row; i++) {
      rect(widthPerBlock*i, 0, 2, height);  //draw horizontal line
    }
    for (int j = 0; j<=column; j++) {
      rect(0, heightPerBlock*j, width, 2);  //draw vertical line
    }
  }

  void drawWorld() {
    for (Wall eachWall : myWall) {
      eachWall.drawWall();        //draw each wall
    }
    myObjective.drawObjective();    //draw objective
    for (Robot each_robot : myRobot) {
      each_robot.drawRobot();     //draw robot
    }
    if ( this.targetCheck()) {
      
      int originRow = myRobot[snakeSize-1].getRow();
      int originColumn = myRobot[snakeSize-1].getColumn();
      snakeSize++;
      Robot[] temp = myRobot;
      myRobot = new Robot[snakeSize];
      for (int j=snakeSize-1; j>=0; j--) {
        if(j==snakeSize-1){
          myRobot[j] = new Robot(originRow-1, originColumn, 40, widthPerBlock, heightPerBlock);
        }
        else{
          myRobot[j] = temp[j];
        }
      }
      myObjective =  new Objective(int(random(11)), int(random(11)), 40, widthPerBlock, heightPerBlock);
    }
  }

  void updateWorld() {
    if (key == 'w' || key == 'W') {
      if ( this.isBlock() == false ) {
        Robot[] temp = new Robot[snakeSize];
        for (int i=1; i<snakeSize; i++) {
          temp[i] = new Robot(myRobot[i-1].getRow(), myRobot[i-1].getColumn(), 40, widthPerBlock, heightPerBlock);
          temp[i].radian = myRobot[i-1].radian;
          println("active");
        }
        myRobot[0].move(1);
        for (int i=1; i<snakeSize; i++) {
          myRobot[i] = temp[i];
        }
      }
    } else if (key == 's' || key == 'S') {
      for (int i = 0; i<20; i++) {
        myRobot[0].move(-1);
      }
    } else if (key == 'a' || key == 'A') {
      myRobot[0].turn(-1);
    } else if (key == 'd' || key == 'D') {
      myRobot[0].turn(1);
    }
  }  

  boolean targetCheck() {
    if (myRobot[0].getRow() == myObjective.getRow() && myRobot[0].getColumn() == myObjective.getColumn()) {
      return true;
    } 
    return false;
  }

  boolean isBlock() { /*
    myRobot.move(1);
   for (int i = 0; i<20; i++) {
   if (myRobot.getRow() == myWall[i].getRow() && myRobot.getColumn() == myWall[i].getColumn()) {
   myRobot.move(-1);
   return true;
   }
   if (myRobot.getRow() > row-1 || myRobot.getRow() < 0 || myRobot.getColumn() > column-1 || myRobot.getColumn() < 0 ) {
   myRobot.move(-1);
   return true;
   }
   }
   myRobot.move(-1); */
    return false;
  }


  void saveWorld(String filename) { /*
    PrintWriter output;
   output = createWriter(filename);
   output.println("worldSize="+this.row+","+this.column);
   output.println("ROBOT="+myRobot.getRow()+","+myRobot.getColumn());
   output.println("Objective="+myObjective.getRow()+","+myObjective.getColumn());
   output.println("wall="+wallSize);
   for (int i = 0; i<wallSize; i++) {
   output.println(myWall[i].getRow()+","+myWall[i].getColumn());
   }
   output.flush(); // Writes the remaining data to the file
   output.close(); // Finishes the file
   */
  }
}

class Snake {
  /* can run snake but not implement with Snake Class work with World Class  */
  int snakeSize =4; 
  Robot[] myRobot; 
  
  Snake(){
    myRobot = new Robot[snakeSize];
    for (int j=snakeSize-1; j>=0; j--) {
      myRobot[j] = new Robot(7-j, 2, 40, widthPerBlock, heightPerBlock);    //instance myRobot at 1,2 size =40 ,and send width,heigh per block
      println(myRobot[j]);
    }
  }
  
  void move(){
    Robot[] temp = new Robot[snakeSize];
        for (int i=1; i<snakeSize; i++) {
          temp[i] = new Robot(myRobot[i-1].getRow(), myRobot[i-1].getColumn(), 40, widthPerBlock, heightPerBlock);
          temp[i].radian = myRobot[i-1].radian;
          println("active");
        }
        myRobot[0].move(1);
        for (int i=1; i<snakeSize; i++) {
          myRobot[i] = temp[i];
        }
  }
  
  
  void drawSnake(){
    
  }
  
  
  void turnLeft(){ 
    myRobot[0].turnLeft();
  } 
  
  void turnRight(){ 
    myRobot[0].turnRight();
  }
  
  
  void getFood(){
     
      int originRow = myRobot[snakeSize-1].getRow();
      int originColumn = myRobot[snakeSize-1].getColumn();
      snakeSize++;
      Robot[] temp = myRobot;
      myRobot = new Robot[snakeSize];
      for (int j=snakeSize-1; j>=0; j--) {
        if(j==snakeSize-1){
          myRobot[j] = new Robot(originRow-1, originColumn, 40, widthPerBlock, heightPerBlock);
        }
        else{
          myRobot[j] = temp[j];
        }
      }
  }
  
}
