import java.util.Collections;


//list of inputs in work area
ArrayList <Input> inputs;

//number of inputs to work with
int numberOfInputs;

//list of outputs in work area
ArrayList<Output> outputs;

//number of outputs to work with
int numberOfOutputs;

//list of gates in work area
ArrayList <IGate> gates;

//list of connections in work area
ArrayList <Connection> connections;

//Truth table
TruthTable truthTbl;



void setup() {

  size(1900, 1600);

  //set number of inputs
  numberOfInputs = 4;

  //set number of outputs
  numberOfOutputs = 3;

  initInputs();
  initOutputs();

  //initialize gates array
  gates = new ArrayList<IGate>();

  //initialize connections
  connections = new ArrayList<Connection>();

  //init truth table
  truthTbl = new TruthTable(600, 300, false);
}

void initInputs() {
  //initailize inputs array
  inputs = new ArrayList<Input>();
  int x = 100;
  int y = 100;
  for (int i = 0; i < numberOfInputs; i++) {
    inputs.add(new Input(x, y, true));
    y+= (height-300)/numberOfInputs;
  }
}

void initOutputs() {
  //Initialize output array
  outputs = new ArrayList<Output>();

  int x = width-200;
  int y = 100;

  for (int i = 0; i < numberOfOutputs; i++) {
    outputs.add(new Output(x, y, false, i));
    y+= (height-300)/numberOfOutputs;
  }
}


void draw() {

  //clear all
  background(0, 0, 0);



  //draw inputs
  drawInputs();

  //draw outputs
  drawOutputs();

  //draw gates gui
  drawGateGUI();

  //draw buttons
  drawButtons();

  //draw all gates
  drawGates();

  //draw all connections
  drawConnections();

  //update output status
  updateOutputs();

  //draw truth table if it is visible
  if (truthTbl.isVisible) {
    drawTruthTable();
  }
}


//draw gui area to hold different gates
void drawGateGUI() {

  stroke(255);
  fill(255);
  rect(0, height - 300, width, 300);

  //put in different gate types
  //AND gate
  drawANDGate(100, height - 250, false);
  //OR gate
  drawORGate(350, height - 250, false);
  //NOT gate
  drawNOTGate(600, height - 250, false);
  //NAND gate
  drawNANDGate(850, height - 250, false);
  //XOR gate
  drawXORGate(1100, height  - 250, false);
  //NOR gate
  drawNORGate(1350, height - 250, false);
  //XNOR Gate
  drawXNORGate(1600, height - 250, false);
}


//draw buttons
void drawButtons() {

  drawCheckTruthTableBtn(100, height - 100);
}


//draw truth table
void drawTruthTable() {

  stroke(0);
  fill(255);
  rect(truthTbl.x, truthTbl.y, 600, 900);

  fill(0);
  textSize(28);
  text("Truth Table", 820, 340);
  textSize(22);
  text("Inputs", 700, 400);

  text("0 0 0 0", 700, 440);
  text(checkSum(false, false, false, false), 1000, 440);
  if (checkSum(false, false, false, false).equals("0 0 0 "))
    drawCorrect(1070, 430);
  else
    drawIncorrect(1070, 430);

  text("0 0 0 1", 700, 480);
  text(checkSum(false, false, false, true), 1000, 480);
  if (checkSum(false, false, false, true).equals("0 0 1 "))
    drawCorrect(1070, 470);
  else
    drawIncorrect(1070, 470);

  text("0 0 1 0", 700, 520);
  text(checkSum(false, false, true, false), 1000, 520);
  if (checkSum(false, false, true, false).equals("0 0 1 "))
    drawCorrect(1070, 510);
  else
    drawIncorrect(1070, 510);

  text("0 1 0 0", 700, 560);
  text(checkSum(false, true, false, false), 1000, 560);
  if (checkSum(false, true, false, false).equals("0 0 1 "))
    drawCorrect(1070, 550);
  else
    drawIncorrect(1070, 550);


  text("1 0 0 0", 700, 600);
  text(checkSum(true, false, false, false), 1000, 600);
  if (checkSum(true, false, false, false).equals("0 0 1 "))
    drawCorrect(1070, 590);
  else
    drawIncorrect(1070, 590);


  text("0 0 1 1", 700, 640);
  text(checkSum(false, false, true, true), 1000, 640);
  if (checkSum(false, false, true, true).equals("0 1 0 "))
    drawCorrect(1070, 630);
  else
    drawIncorrect(1070, 630);


  text("0 1 0 1", 700, 680);
  text(checkSum(false, true, false, true), 1000, 680);
  if (checkSum(false, true, false, true).equals("0 1 0 "))
    drawCorrect(1070, 670);
  else
    drawIncorrect(1070, 670);


  text("1 0 0 1", 700, 720);
  text(checkSum(true, false, false, true), 1000, 720);
  if (checkSum(true, false, false, true).equals("0 1 0 "))
    drawCorrect(1070, 710);
  else
    drawIncorrect(1070, 710);


  text("0 1 1 0", 700, 760);
  text(checkSum(false, true, true, false), 1000, 760);
  if (checkSum(false, true, true, false).equals("0 1 0 "))
    drawCorrect(1070, 750);
  else
    drawIncorrect(1070, 750);


  text("1 0 1 0", 700, 800);
  text(checkSum(true, false, true, false), 1000, 800);
  if (checkSum(true, false, true, false).equals("0 1 0 "))
    drawCorrect(1070, 790);
  else
    drawIncorrect(1070, 790);


  text("1 1 0 0", 700, 840);
  text(checkSum(true, true, false, false), 1000, 840);
  if (checkSum(true, true, false, false).equals("0 1 0 "))
    drawCorrect(1070, 830);
  else
    drawIncorrect(1070, 830);

  text("0 1 1 1", 700, 880);
  text(checkSum(false, true, true, true), 1000, 880);
  if (checkSum(false, true, true, true).equals("0 1 1 "))
    drawCorrect(1070, 870);
  else
    drawIncorrect(1070, 870);

  text("1 0 1 1", 700, 920);
  text(checkSum(true, false, true, true), 1000, 920);
  if (checkSum(true, false, true, true).equals("0 1 1 "))
    drawCorrect(1070, 910);
  else
    drawIncorrect(1070, 910);

  text("1 1 0 1", 700, 960);
  text(checkSum(true, true, false, true), 1000, 960);
  if (checkSum(true, true, false, true).equals("0 1 1 "))
    drawCorrect(1070, 950);
  else
    drawIncorrect(1070, 950);

  text("1 1 1 0", 700, 1000);
  text(checkSum(true, true, true, false), 1000, 1000);
  if (checkSum(true, true, true, false).equals("0 1 1 "))
    drawCorrect(1070, 990);
  else
    drawIncorrect(1070, 990);

  text("1 1 1 1", 700, 1040);
  text(checkSum(true, true, true, true), 1000, 1040);
  if (checkSum(true, true, true, true).equals("1 0 0 "))
    drawCorrect(1070, 1030);
  else
    drawIncorrect(1070, 1030);

  text("Outputs", 1000, 400);
}

//draw green check mark
void drawCorrect(int x, int y) {
  stroke(0, 255, 0);
  line(x, y, x+10, y+10);
  line(x+10, y+10, x+20, y-20);
}

//draw red X
void drawIncorrect(int x, int y) {
  stroke(255, 0, 0);
  line(x, y-10, x+20, y+10);
  line(x+20, y-10, x, y+10);
}

//check value output for some given inputs
String checkSum(Boolean A, Boolean B, Boolean C, Boolean D) {

  //set inputs cooresponding to A B C & D
  inputs.get(0).isActive = A;
  inputs.get(1).isActive = B;
  inputs.get(2).isActive = C;
  inputs.get(3).isActive = D;

  updateOutputs();

  //get sum of outputs
  String binary = "";
  if (outputs.get(2).isActive) {
    binary += 1 + " ";
  } else {
    binary += 0 + " ";
  }
  if (outputs.get(1).isActive) {
    binary += 1 + " ";
  } else {
    binary += 0 + " ";
  }
  if (outputs.get(0).isActive) {
    binary += 1 + " ";
  } else {
    binary += 0 + " ";
  }


  return binary;
}


void drawCheckTruthTableBtn(int x, int y) {

  stroke(0);
  if (mouseX >= x && mouseX <= x+300 && mouseY >= y && mouseY <= y + 50) {
    fill(255, 255, 102);
  } else {
    fill(255);
  }
  rect(x, y, 300, 50, 10);

  fill(0);
  textSize(28);
  text("Check Thruth Table", x + 20, y + 35);
}

void toggleTruthTable() {
  if (truthTbl.isVisible)
    truthTbl.isVisible = false;
  else
    truthTbl.isVisible = true;
}


void drawInputs() {
  for (Input input : inputs) {
    drawInput(input.x, input.y, input.isActive);
  }
}

void drawGates() {
  for (IGate gate : gates) {

    gate.drawThisGate();

    if (gate.doFollowMouse()) {
      gate.setX(mouseX);
      gate.setY(mouseY);
    }
  }
}



//draw single input
void drawInput(int x, int y, boolean isActivated) {

  stroke(0, 0, 0);
  fill(255);
  rect(x, y, 100, 100);

  fill(0);
  textSize(32);

  if (isActivated)
    text("1", x+40, y+60);
  else
    text("0", x+40, y+60);


  strokeWeight(5);
  //if active set color to green
  //inactive... red
  if (isActivated) {
    stroke(0, 255, 0);
  } else {
    stroke(255, 0, 0);
  }

  line(x+100, y+50, x+150, y+50);
}


//draw all outputs
void drawOutputs() {
  for (Output output : outputs) {
    drawOutput(output.x, output.y, output.isActive, output.base);
  }
}

//draw single output
void drawOutput(int x, int y, boolean isActivated, int base) {

  stroke(0, 0, 0);
  fill(255);
  rect(x, y, 100, 100);

  fill(0);
  textSize(32);
  text("2", x+40, y+65);
  textSize(16);
  text(str(base), x+60, y+45);

  strokeWeight(5);
  //if active set color to green
  //inactive... red
  if (isActivated) {
    stroke(0, 255, 0);
  } else {
    stroke(255, 0, 0);
  }

  line(x, y+50, x-50, y+50);
}  


void updateOutputs() {
  for (Output output : outputs) {
    int connectedPoints = 0;
    for (Connection connection : connections) {
      for (Point p : connection.points) {
        //if a point p is connected to this output, use to update that output's status
        if (p.x >= output.x-60 && p.x <= output.x-40) {
          if (p.y >= output.y + 40 && p.y <= output.y + 60 ) {
            output.isActive = connection.isActivated();
            connectedPoints++;
          }
        }
      }
    }

    if (connectedPoints == 0) {
      output.isActive = false;
    }
  }
}

void drawConnections() {
  //list of connection indicies to remove - (only when no gate is available)
  ArrayList<Integer> connectionsToRemove = new ArrayList<Integer>();
  int currentIndex = 0;
  for (Connection connection : connections) {

    //detect if all gates have been removed... IF GATES SIZE == 0, REMOVE ALL
    if (!connection.isOnInput && gates.size() <= connection.index) {
      connectionsToRemove.add(currentIndex);
    } else {

      //set line color according to isActivated
      if (connection.isActivated()) {
        stroke(0, 255, 0); 
        fill(0, 255, 0);
      } else {
        stroke(255, 0, 0); 
        fill(255, 0, 0);
      }

      if (!connection.isOnInput && gates.size() <= connection.index) {
        connectionsToRemove.add(currentIndex);
      } else {

        //draw placed connections from point to point
        int pointIndex = 0;
        for (Point point : connection.points) {

          if (pointIndex == 0 && !connection.isOnInput && connection.points.size() > 1) { //should follow connection
            ellipse(gates.get(connection.index).getX()+150, gates.get(connection.index).getY()+50, 20, 20);
            line(gates.get(connection.index).getX()+150, gates.get(connection.index).getY()+50, connection.points.get(pointIndex+1).x, connection.points.get(pointIndex+1).y);
          } else if (pointIndex < connection.points.size()-1) {
            //draw current point and draw line to next point's x,y
            ellipse(point.x, point.y, 20, 20);
            line(point.x, point.y, connection.points.get(pointIndex+1).x, connection.points.get(pointIndex+1).y);
          } else if (pointIndex == connection.points.size()-1 && connection.isPlaced) {
            ellipse(point.x, point.y, 20, 20);
          }



          //extra: draw unplaced connections from point to point to mouseX, mouseY
          if (!connection.isPlaced && pointIndex == connection.points.size()-1) {
            line(point.x, point.y, mouseX, mouseY);
          }

          pointIndex++;
        }
      }
    }
    currentIndex++;
  }

  //loop thru connectionsToRemove and remove from connections
  //sort list in descending order
  Collections.sort(connectionsToRemove, Collections.reverseOrder());
  for (Integer i : connectionsToRemove) {
    connections.remove(i);
  }
}




//draw AND gate
void drawANDGate(int x, int y, boolean isActivated) {
  stroke(0, 0, 0);
  fill(255);
  rect(x, y, 100, 100, 0, 50, 50, 0);
  fill(0);
  textSize(28);
  text("AND", x+20, y+60);

  strokeWeight(5);
  if (!isActivated) {
    stroke(255, 0, 0);
  } else {
    stroke(0, 255, 0);
  }
  line(x+100, y+50, x+150, y+50);
}

//draw OR gate
void drawORGate(int x, int y, boolean isActivated) {
  stroke(0, 0, 0);
  fill(255);

  rect(x, y, 100, 100, 0, 50, 50, 0);
  //arc(x, y+50, 25, 100, 0, PI-HALF_PI, 0);

  arc(x, y+50, 30, 100, -PI/2.0, PI/2.0);


  if (y > height - 250) {
    stroke(255, 255, 255);
  }

  line(x, y, x, y + 100);
  stroke(0, 0, 0);

  fill(0);

  textSize(28);
  text("OR", x+30, y+60);

  strokeWeight(5);
  if (!isActivated) {
    stroke(255, 0, 0);
  } else {
    stroke(0, 255, 0);
  }
  line(x+100, y+50, x+150, y+50);
}

void drawNOTGate(int x, int y, boolean isActivated) {
  stroke(0, 0, 0);
  fill(255);

  triangle(x, y, x, y+100, x+100, y+50);

  stroke(0, 0, 0);

  fill(0);

  textSize(28);
  text("NOT", x+5, y+60);

  strokeWeight(5);
  if (!isActivated) {
    stroke(255, 0, 0);
  } else {
    stroke(0, 255, 0);
  }
  line(x+100, y+50, x+150, y+50);
}

void drawNANDGate (int x, int y, boolean isActivated) {
  stroke(0, 0, 0);
  fill(255);

  rect(x, y, 100, 100, 0, 50, 50, 0);
  ellipse(x+100, y + 50, 15, 15);

  stroke(0, 0, 0);

  fill(0);

  textSize(28);
  text("NAND", x+5, y+60);

  strokeWeight(5);
  if (!isActivated) {
    stroke(255, 0, 0);
  } else {
    stroke(0, 255, 0);
  }
  line(x+100, y+50, x+150, y+50);
}


void drawXORGate (int x, int y, boolean isActivated) {
  stroke(0, 0, 0);
  fill(255);

  rect(x, y, 100, 100, 0, 50, 50, 0);
  //arc(x, y+50, 25, 100, 0, PI-HALF_PI, 0);

  arc(x, y+50, 30, 100, -PI/2.0, PI/2.0);




  if (y > height - 250) {
    stroke(255, 255, 255);
  }

  line(x, y, x, y + 100);

  arc(x - 10, y+50, 30, 100, -PI/2.0, PI/2.0);
  stroke(0, 0, 0);

  fill(0);

  textSize(28);
  text("XOR", x+25, y+60);

  strokeWeight(5);
  if (!isActivated) {
    stroke(255, 0, 0);
  } else {
    stroke(0, 255, 0);
  }
  line(x+100, y+50, x+150, y+50);
}


void drawNORGate(int x, int y, boolean isActivated) {
  stroke(0, 0, 0);
  fill(255);

  rect(x, y, 100, 100, 0, 50, 50, 0);
  //arc(x, y+50, 25, 100, 0, PI-HALF_PI, 0);

  arc(x, y+50, 30, 100, -PI/2.0, PI/2.0);

  ellipse(x+100, y + 50, 15, 15);



  if (y > height - 250) {
    stroke(255, 255, 255);
  }

  line(x, y, x, y + 100);

  stroke(0, 0, 0);

  fill(0);

  textSize(28);
  text("NOR", x+25, y+60);

  strokeWeight(5);
  if (!isActivated) {
    stroke(255, 0, 0);
  } else {
    stroke(0, 255, 0);
  }
  line(x+100, y+50, x+150, y+50);
}



void drawXNORGate(int x, int y, boolean isActivated) {
  stroke(0, 0, 0);
  fill(255);

  rect(x, y, 100, 100, 0, 50, 50, 0);
  //arc(x, y+50, 25, 100, 0, PI-HALF_PI, 0);

  arc(x, y+50, 30, 100, -PI/2.0, PI/2.0);

  ellipse(x+100, y + 50, 15, 15);



  if (y > height - 250) {
    stroke(255, 255, 255);
  }

  line(x, y, x, y + 100);

  stroke(0, 0, 0);

  arc(x - 10, y+50, 30, 100, -PI/2.0, PI/2.0);

  fill(0);

  textSize(28);
  text("XNOR", x+15, y+60);

  strokeWeight(5);
  if (!isActivated) {
    stroke(255, 0, 0);
  } else {
    stroke(0, 255, 0);
  }
  line(x+100, y+50, x+150, y+50);
}



//detect selecting gate element
void mousePressed() {


  //detect press on check truth table btn
  if (mouseX >= 100 && mouseX <= 400 && mouseY >= height-100 && mouseY <= height - 50) {
    toggleTruthTable();
  }

  boolean connectionInProgress = connectionInProgress();

  //detect if pressed in gate gui area
  if (mouseY > height - 300 && mouseButton == LEFT && !connectionInProgress) {

    //selecting AND gate
    if (mouseX >= 100 && mouseX <= 200 && mouseY >= height-250 && mouseY <= height-150) {
      //add new AND gate where mouse is
      gates.add(new ANDGate(mouseX, mouseY, true));
    }

    //selecting OR gate
    if (mouseX >= 350 && mouseX <= 450 && mouseY >= height - 250 && mouseY <= height - 150) {
      //add new OR gate at mouse
      gates.add(new ORGate(mouseX, mouseY, true));
    }

    //selecting NOT gate
    if (mouseX >= 600 && mouseX <= 750 && mouseY >= height - 250 && mouseY <= height - 150) {
      //add new NOT gate at mouse
      gates.add(new NOTGate(mouseX, mouseY, true));
    }

    //selecting NAND gate
    if (mouseX >= 850 && mouseX <= 1000 && mouseY >= height - 250 && mouseY <= height - 150) {
      //add new NOT gate at mouse
      gates.add(new NANDGate(mouseX, mouseY, true));
    }

    //selecting XOR gate
    if (mouseX >= 1100 && mouseX <= 1250 && mouseY >= height - 250 && mouseY <= height - 150) {
      //add new XOR gate at mouse
      gates.add(new XORGate(mouseX, mouseY, true));
    }

    //selecting NOR gate
    if (mouseX >= 1350 && mouseX <= 1500 && mouseY >= height - 250 && mouseY <= height - 150) {
      //add new XOR gate at mouse
      gates.add(new NORGate(mouseX, mouseY, true));
    }

    //selecting XNOR gate
    if (mouseX >= 1600 && mouseX <= 1750 && mouseY >= height - 250 && mouseY <= height - 150) {
      //add new XOR gate at mouse
      gates.add(new XNORGate(mouseX, mouseY, true));
    }
  } else {


    //detect pressing on existing gate (in work area)
    for (IGate gate : gates) {
      if (mouseX >= gate.getX() && mouseX <= gate.getX()+100 && mouseY >= gate.getY() && mouseY <= gate.getY()+100) {
        gate.setFollowMouse(true);
      }
    }



    //detect making a new connection from input (selecting an input to add a connection from)
    //only start check if mouseX is less/equal to 250 & y mouseY is not in GUI area & no connection is currently being made
    //first store if a connection is in progress
    if (!connectionInProgress && mouseX <=250 && mouseX>=200 && mouseY < height-300) {

      int inputIndex= 0;
      for (Input input : inputs) {
        if (mouseX >= input.x && mouseX <= input.x+150 && mouseY >= input.y && mouseY <= input.y+100) {
          //add new connection
          connections.add(new Connection(input.x+150, input.y+50, true, inputIndex));
        }
        inputIndex++;
      }
    }

    boolean newFromGate = false;

    //detect making new connection from gate
    if (!connectionInProgress && mouseY < height-300) {
      int gateIndex = 0;
      for (IGate gate : gates) {
        if (mouseX >= gate.getX()+100 && mouseX <= gate.getX()+150 && mouseY >= gate.getY()+25 && mouseY <= gate.getY()+75) {
          //new connection
          connections.add(new Connection(gate.getX()+150, gate.getY()+50, false, gateIndex ));
          newFromGate = true;
          break;
        }
        gateIndex++;
      }
    }

    connectionInProgress = connectionInProgress();

    //if a connection is in progress... allow new point to be added (if mouseX >= 250)
    if (connectionInProgress && !newFromGate) {
      if (mouseX >= 250 && mouseY < height - 300) {

        //set place for all open connection
        for (Connection c : connections) {
          if (!c.isPlaced) {
            c.addPoint(mouseX, mouseY);
            c.isPlaced = true;
          }
        }

        //        connections.get(connections.size()-1).addPoint(mouseX, mouseY);
        //        //set is placed to true
        //        connections.get(connections.size()-1).isPlaced = true;
      }
    }





    //detect selection of a point (right click to add new point, left click to remove point)
    if (!connectionInProgress) {
      if (mouseButton == LEFT) {
        leftClickNearConnectionPoint(mouseX, mouseY);
      } else if (mouseButton == RIGHT) {
        rightClickNearConnectionPoint(mouseX, mouseY);
      }
    }

    //detect pressing on input (should toggle isActivated)
    if (mouseX >= 100 && mouseX <= 200 && mouseY <= height - 300) {
      for (Input input : inputs) {
        if (mouseY <= input.y+100 && mouseY >= input.y) {
          input.toggleIsActive();
        }
      }
    }
  }
}


//get current unplaced connection
Connection getUnplacedConnection() {
  for (Connection c : connections) {
    if (!c.isPlaced) {
      return c;
    }
  }
  return null;
}

//check if x,y is near a connection point
boolean leftClickNearConnectionPoint(int x, int y) {
  for (Connection c : connections) {
    for (Point p : c.points) {
      if (x >= p.x - 10 && x <= p.x + 10 && y >= p.y - 10 && y <= p.y + 10) {
        c.isPlaced = false;
        return true;
      }
    }
  }
  return false;
}

boolean rightClickNearConnectionPoint(int x, int y) {
  int pointToRemoveIndex = -1;
  for (Connection c : connections) {
    int index = 0;
    for (Point p : c.points) {
      if (x >= p.x - 10 && x <= p.x + 10 && y >= p.y - 10 && y <= p.y + 10) {
        pointToRemoveIndex = index;
        break;
      }
      index++;
    }
    if (pointToRemoveIndex != -1) {
      c.points.remove(pointToRemoveIndex);
      return true;
    }
  }

  return false;
}

//check if a connection is being made
boolean connectionInProgress() {
  for (Connection connection : connections) {
    if (!connection.isPlaced) {
      return true;
    }
  }
  return false;
}

//detect releasing gate element
void mouseReleased() {

  //set follow mouse to false
  int index = 0;
  ArrayList<Integer> indeciesToRemove = new ArrayList<Integer>();
  for (IGate gate : gates) {
    if (gate.doFollowMouse()) {
      gate.setFollowMouse(false);
    }

    //check if circut is in legal bounds for removing gate
    if (gate.getY() >= height - 300) {
      indeciesToRemove.add(index);
    }

    index++;
  }
  //remove illegal indecies
  //allocate list to remove connections from gate
  ArrayList<Integer> gateConnections = new ArrayList<Integer>();
  Collections.sort(indeciesToRemove);
  Collections.reverse(indeciesToRemove);
  for (Integer i : indeciesToRemove) {
    gates.remove((int)i);

    //if a connection is on gate at this index i, then remove that connection
    for (Connection c : connections) {
      if (!c.isOnInput && c.index == i) {
        gateConnections.add(i);
      }
    }
  }

  //remove connections from removed gate
  Collections.sort(gateConnections);
  Collections.reverse(gateConnections);
  for (Integer i : gateConnections) {
    connections.remove(i);
  }
}
