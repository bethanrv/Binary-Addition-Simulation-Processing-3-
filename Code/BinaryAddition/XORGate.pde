class XORGate implements IGate {
  int x;
  int y;
  boolean isActivated;
  boolean followMouse;
  ArrayList <Connection> gateInputs;

  XORGate(int x, int y, boolean followMouse) {
    this.x = x;
    this.y = y;
    isActivated = false;
    this.followMouse = followMouse;
    gateInputs = new ArrayList<Connection>();
  }

  void drawThisGate() {
    drawXORGate(x, y, isActivated());
  }


  boolean isActivated() {

    getConnections();
    
    


    //if no inputs return false
    if (gateInputs.size()==0) {
      return false;
    }
    
    //for xor gate, only one input must be on
    int count = 0;
    for (Connection c : gateInputs) {

      if(count > 1){
        isActivated = false;
        return false;
      }
      
      if (c.isActivated()) {
        count++;
      }
    }
    
    if(count == 1){
      isActivated = true;
      return true;
    }
    
    isActivated = false;
    return false;
    
  }

  void getConnections() {

    gateInputs.clear();

    for (Connection c : connections) {
      for (Point p : c.points) {
        if (p.x > (x-20) && p.x < (x+20)) {
          if (p.y > (y-20) && p.y < (y+120)) {
            addInputConnection(c);
          }
        }
      }
    }
  }

  boolean addInputConnection(Connection c) {
    return gateInputs.add(c);
  }

  boolean removeInputConnection(Connection c) {
    return gateInputs.remove(c);
  }


  ArrayList <Connection> getGateInputs() {
    return gateInputs;
  }

  void setGateInputs(ArrayList inputs) {
    gateInputs = inputs;
  }

  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  void setX(int x) {
    this.x = x;
  }
  void setY(int y) {
    this.y = y;
  }
  boolean doFollowMouse() {
    return followMouse;
  }
  void setFollowMouse(boolean followMouse) {
    this.followMouse = followMouse;
  }
}
