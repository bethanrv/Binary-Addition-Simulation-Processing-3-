interface IGate {
  
  int getX();
  
  int getY();
  
  void setX(int x);
  
  void setY(int y);
  
  void drawThisGate();
  
  boolean doFollowMouse();
  
  void setFollowMouse(boolean doFollow);
  
  boolean addInputConnection(Connection c);
  
  boolean removeInputConnection(Connection c);
  
  boolean isActivated();
  
  ArrayList<Connection> getGateInputs();
  
  void setGateInputs(ArrayList inputs);
}
